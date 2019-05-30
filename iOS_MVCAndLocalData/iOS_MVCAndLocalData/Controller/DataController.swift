//
//  DataController.swift
//  iOS_MVCAndLocalData
//
//  Created by THE DUY NGUYEN on 29/5/19.
//  Copyright © 2019 THE DUY NGUYEN. All rights reserved.
//

import Foundation

class DataController{
    weak var delegate: DataControllerDelegate?

    
    func requestData(fileName: String){
        guard var copyFileToPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            fatalError("Missing copy path in project!!!")
        }
        
        //Generate path
        copyFileToPath = copyFileToPath + fileName
        
        if loadFile(copyFileToPath: copyFileToPath) {
            let url = URL(fileURLWithPath: copyFileToPath)
            let jsonData = try! Data(contentsOf: url)
            
            let peopleList = try!JSONDecoder().decode([Person].self, from: jsonData)
            
            //Pass data to delegate
            self.delegate?.didReceivedPeople(people: peopleList)
            
        } else {
            print("Could not load file")
        }
    }
    
    private func loadFile(copyFileToPath: String)->Bool{
        //Check whether JSON file exists in the local MAC
        if FileManager.default.fileExists(atPath: copyFileToPath) {
            print("people.json already exists in local !!!")
            return true
        }
        
        //Check whether JSON file exists in the project
        guard let copyFileFromUrl = Bundle.main.url(forResource: "people", withExtension: "json") else {
            fatalError("Missing people.json in project!!!")
        }
        
        //Try to copy JSON file from the project to the local MAC
        do{
            try FileManager.default.copyItem(atPath: copyFileFromUrl.path, toPath: copyFileToPath)
        }catch{
            print("Could not copy file")
            return false
        }
        return true
    }
}

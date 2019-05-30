//
//  ViewController.swift
//  iOS_MVCAndLocalData
//
//  Created by THE DUY NGUYEN on 29/5/19.
//  Copyright © 2019 THE DUY NGUYEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var peopleTableView: UITableView!
    private let dataController = DataController()
    
    fileprivate var listOfPeople = [Person](){
        didSet{
            self.peopleTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initialize()
    }
    
    private func initialize(){
        peopleTableView.delegate = self
        peopleTableView.dataSource = self
        
        dataController.delegate = self
        
        dataController.requestData(fileName: "people.json")
    }


}


//Create extension to conform delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfPeople.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let peopleCell = tableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath) as! PeopleTableViewCell
        let person = listOfPeople[indexPath.row]
        
        peopleCell.bind(person: person)
        
        return peopleCell
    }
    
    
}

extension ViewController: DataControllerDelegate{
    func didReceivedPeople(people: [Person]) {
        self.listOfPeople = people
    }
}

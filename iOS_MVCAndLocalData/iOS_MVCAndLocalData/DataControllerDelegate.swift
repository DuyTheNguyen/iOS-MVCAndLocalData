//
//  DataControllerDelegate.swift
//  iOS_MVCAndLocalData
//
//  Created by THE DUY NGUYEN on 29/5/19.
//  Copyright © 2019 THE DUY NGUYEN. All rights reserved.
//

import Foundation

protocol DataControllerDelegate: class {
    func didReceivedPeople(people: [Person])
}

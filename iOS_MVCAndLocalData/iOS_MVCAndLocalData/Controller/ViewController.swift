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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initialize()
    }
    
    private func initialize(){
        peopleTableView.delegate = self
        peopleTableView.dataSource = self
    }


}


//Create extension to conform delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

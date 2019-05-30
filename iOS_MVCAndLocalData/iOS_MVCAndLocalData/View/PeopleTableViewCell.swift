//
//  PeopleTableViewCell.swift
//  iOS_MVCAndLocalData
//
//  Created by THE DUY NGUYEN on 29/5/19.
//  Copyright © 2019 THE DUY NGUYEN. All rights reserved.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(person: Person){
        nameLabel.text = person.name
        occupationLabel.text = person.occupation
        addressLabel.text = person.address
    }

}

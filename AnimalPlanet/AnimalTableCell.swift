//
//  AnimalTableCell.swift
//  AnimalPlanet
//
//  Created by Vadim Shoshin on 31.10.2017.
//  Copyright © 2017 Vadim Shoshin. All rights reserved.
//

import UIKit

class AnimalTableCell: UITableViewCell {
    @IBOutlet weak var animalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func update(incLabel: String)
    {
        animalLabel.text = incLabel
    }

}

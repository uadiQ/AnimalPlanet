//
//  DetailsViewController.swift
//  AnimalPlanet
//
//  Created by Vadim Shoshin on 01.11.2017.
//  Copyright © 2017 Vadim Shoshin. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak private var detailsLabel: UILabel!
    
    var animal: Animal?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = animal?.name
        detailsLabel.text = animal?.description
    }

}

//
//  Animal.swift
//  AnimalPlanet
//
//  Created by Vadim Shoshin on 31.10.2017.
//  Copyright © 2017 Vadim Shoshin. All rights reserved.
//

import UIKit

enum AnimalType {
    case bird, fish, insect, mammal
    func description() -> String {
        switch self {
        case .bird:
            return("Bird")
        case .fish:
            return("Fish")
        case .insect:
            return("Insect")
        case .mammal:
            return("Mammal")
        }
    }
}

struct Animal {
    let subClass: AnimalType
    let name: String
    var description: String {
        return(self.name + ", " + self.subClass.description())
        }
    }

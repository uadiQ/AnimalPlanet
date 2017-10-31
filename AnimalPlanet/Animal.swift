//
//  Animal.swift
//  AnimalPlanet
//
//  Created by Vadim Shoshin on 31.10.2017.
//  Copyright © 2017 Vadim Shoshin. All rights reserved.
//

import UIKit

enum animalType
{
    case Bird, Fish, Insect, Mammal
    func description() -> String
    {
        switch self
        {
        case .Bird:
            return("Bird")
        case .Fish:
            return("Fish")
        case .Insect:
            return("Insect")
        case .Mammal:
            return("Mammal")
        }
    }
}

struct Animal
{
    let subClass: animalType
    let name: String
    
    var description:String
    {
        get
        {
            return(name + ", " + subClass.description())
        }
    }
}

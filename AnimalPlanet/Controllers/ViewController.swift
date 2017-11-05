//
//  ViewController.swift
//  AnimalPlanet
//
//  Created by Vadim Shoshin on 31.10.2017.
//  Copyright © 2017 Vadim Shoshin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var animals: [Animal] = []
    private var datasource: [String: [Animal]] = [:]
    private var subTypeKeys: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animal Planet"
        tableView.delegate = self
        tableView.dataSource = self
        generateTableData()
    }
    
    private func generateTableData() {
        animals.append(Animal(subClass: .bird, name: "Stork"))
        animals.append(Animal(subClass: .bird, name: "Albatross"))
        animals.append(Animal(subClass: .bird, name: "Humming bird"))
        animals.append(Animal(subClass: .bird, name: "Parrot"))
        animals.append(Animal(subClass: .fish, name: "Carp"))
        animals.append(Animal(subClass: .fish, name: "Catfish"))
        animals.append(Animal(subClass: .insect, name: "Hornet"))
        animals.append(Animal(subClass: .mammal, name: "Lion"))
        animals.append(Animal(subClass: .mammal, name: "Hare"))
        animals.append(Animal(subClass: .mammal, name: "Bear"))
        
        for item in animals {
            let subClassValue = item.subClass.description()
            var testValue = datasource[subClassValue] ?? []
            testValue.append(item)
            datasource[subClassValue] = testValue
        }
        subTypeKeys = Array(datasource.keys)
    }
    
    private func getAnimal(indexPath: IndexPath) -> Animal? {
        let key = subTypeKeys[indexPath.section]
        let animalsForSection = datasource[key]
        return animalsForSection?[indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowDetails", let destVC = segue.destination as? DetailsViewController
            else { return }
        
        guard let cell = sender as? UITableViewCell
            else { return }
        
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        guard let item = getAnimal(indexPath: indexPath) else { return }
        destVC.animal = item
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = subTypeKeys[section]
        let animalsForSection = datasource[key] ?? []
        return animalsForSection.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return subTypeKeys[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableCell", for: indexPath) as? AnimalTableCell
            else {
                fatalError("Wrong type of cell")
        }
        
        guard let item = getAnimal(indexPath: indexPath) else {
            fatalError("Animal with wrong indexPath")
        }
        cell.update(incLabel: item.name)
        return cell
    }
}

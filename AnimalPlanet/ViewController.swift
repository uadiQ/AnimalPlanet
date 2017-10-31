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
    
    private var datasource: [Animal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        generateTableData()
    }
    
    private func generateTableData()
    {
        datasource.append(Animal(subClass: .Bird, name: "Stork"))
        datasource.append(Animal(subClass: .Bird, name: "Albatross"))
        datasource.append(Animal(subClass: .Bird, name: "Humming bird"))
        datasource.append(Animal(subClass: .Bird, name: "Parrot"))
        datasource.append(Animal(subClass: .Fish, name: "Carp"))
        datasource.append(Animal(subClass: .Fish, name: "Catfish"))
        datasource.append(Animal(subClass: .Insect, name: "Hornet"))
        datasource.append(Animal(subClass: .Mammal, name: "Lion"))
        datasource.append(Animal(subClass: .Mammal, name: "Hare"))
        datasource.append(Animal(subClass: .Mammal, name: "Bear"))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowDetails", let destVC = segue.destination as? DetailsViewController
            else
        {
            return
        }
        
        guard let cell = sender as? UITableViewCell
            else
        {
            return
        }
        
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let item = datasource[indexPath.row]
        destVC.animal = item
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
        //return datasource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableCell", for: indexPath) as? AnimalTableCell
            else
        {
            fatalError("Wrong type of cell")
        }
        
        let item = datasource[indexPath.row]
        cell.update(incLabel: item.name)
        return cell
    }
}

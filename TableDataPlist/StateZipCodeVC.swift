//
//  StateZipCodeVC.swift
//  TableDataPlist
//
//  Created by Nagender Kumar on 22/05/24.
//

import UIKit

class StateZipCodeVC: UIViewController, UITableViewDataSource, UITableViewDelegate, ZipCodeUpdateDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedZipCodes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedZipCodes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = selectedZipCodes[indexPath.row]
        return cell
    }
    
    // MARK: - Table view delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ZipCodeUpdateVC", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ZipCodeUpdateVC",
           let destinationVC = segue.destination as? ZipCodeUpdateVC,
           let index = sender as? Int {
            destinationVC.selectedZipCode = selectedZipCodes[index]
            destinationVC.selectedIndex = index
            destinationVC.delegate = self
        }
    }
    
    // MARK: - ZipCodeUpdateDelegate

    func didUpdateZipCode(newZipCode: String, at index: Int) {
        selectedZipCodes[index] = newZipCode
        tableView.reloadData()
    }
}




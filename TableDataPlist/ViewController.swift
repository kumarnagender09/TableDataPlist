//
//  ViewController.swift
//  TableDataPlist
//
//  Created by Nagender Kumar on 22/05/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var items: [Item] = []
    var selectedZipCodes: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Load data from plist
        if let path = Bundle.main.path(forResource: "statedictionary", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path) as? [String: [String]] {
            items = dict.map { key, value in
                return Item(state: key, zipCodes: value)
            }
        }
        // Register table view cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Set table view delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.state
        return cell
    }

    // MARK: - Table view delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedItem = items[indexPath.row]
            selectedZipCodes = selectedItem.zipCodes
        performSegue(withIdentifier: "StateZipCodeVC", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "StateZipCodeVC",
               let destinationVC = segue.destination as? StateZipCodeVC {
                destinationVC.selectedZipCodes = selectedZipCodes
            }
        }
}

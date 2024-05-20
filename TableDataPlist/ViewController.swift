//
//  ViewController.swift
//  TableDataPlist
//
//  Created by Nagender Kumar on 20/05/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var items: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Load data from plist
        if let path = Bundle.main.path(forResource: "Data", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path) as? [String: Any],
            let itemData = dict["Items"] as? [[String: String]] {
            items = itemData.map { itemDict in
                return Item(title: itemDict["Title"] ?? "", description: itemDict["Description"] ?? "")
            }
        }
        // Register table view cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.description
        return cell
    }
}


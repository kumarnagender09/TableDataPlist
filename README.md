# TableDataPlist
To fetch data from a plist file and display it in a table view in Swift for iOS, you can follow these steps:

Add the plist file to your Xcode project:

Drag the plist file into your Xcode project.
Make sure the plist file is included in the app's bundle.
Create a Model (optional):

If your plist contains complex data structures, consider creating a model to represent the data.
For simple data, you can directly use an array or dictionary.
Read Data from the plist file:

swift
Copy code
guard let path = Bundle.main.path(forResource: "YourPlistFileName", ofType: "plist"),
      let dict = NSDictionary(contentsOfFile: path) as? [String: Any] else {
    return
}

// If you have a model, you can map the plist data to your model
// For example, if you have an array of dictionaries
let items = (dict["Items"] as? [[String: Any]])?.compactMap { itemDict in
    return YourModel(itemDict)
}
Display Data in a Table View:

Use the fetched data to populate your table view.
Implement the UITableViewDataSource methods:
swift
Copy code
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "YourCellIdentifier", for: indexPath)
    let item = items[indexPath.row]
    cell.textLabel?.text = item.title
    // Configure cell...
    return cell
}
Make sure to replace "YourPlistFileName", "Items", YourModel, and "YourCellIdentifier" with your actual plist file name, key for the data array, your model class (if applicable), and your cell identifier, respectively.

Remember to set your view controller as the table view's dataSource and implement any other necessary table view methods as per your requirements.

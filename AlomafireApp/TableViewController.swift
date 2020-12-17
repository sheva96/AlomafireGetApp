//
//  TableViewController.swift
//  AlomafireApp
//
//  Created by Yevhen Shevchenko on 17.12.2020.
//

import UIKit

class TableViewController: UITableViewController {
    
    var currency: [Currency] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkManager.shared.fetchData { getCurrency in
            self.currency = getCurrency
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currency.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let value = currency[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = value.currency
        content.secondaryText = value.code
        
        cell.contentConfiguration = content
        
        return cell
    }
}

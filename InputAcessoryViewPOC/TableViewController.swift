//
//  TableViewController.swift
//  InputAccessoryViewPOC
//
//  Created by Itallo Rossi Lucas on 09/08/17.
//  Copyright © 2017 kallahir. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.navigationItem.title = "Table View"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(open))
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Cell \(indexPath.row+1)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }

    func open() {
        let collectionViewController = CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        self.navigationController?.pushViewController(collectionViewController, animated: true)
    }
    
}

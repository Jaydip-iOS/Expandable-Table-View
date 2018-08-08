//
//  ViewController.swift
//  ExpandableTableView
//
//  Created by PC on 08/08/18.
//  Copyright © 2018 Jaydip Finava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var section =
        [
            Section.init(genre: "test1", movies: ["a","b","C","D"], expanded: false),
            Section.init(genre: "test1", movies: ["a","b","C","D"], expanded: false),
            Section.init(genre: "test1", movies: ["a","b","C","D"], expanded: false),
            Section.init(genre: "test1", movies: ["a","b","C","D"], expanded: false),
            Section.init(genre: "test1", movies: ["a","b","C","D"], expanded: false)
        ]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource, ExpandableHeaderViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return section.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.section[section].movies.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.section[indexPath.section].expanded {
            return 44
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.customInit(title: self.section[section].genre, section: section, delegate: self)
        return header
    }
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        self.section[section].expanded = !self.section[section].expanded
        tableView.beginUpdates()
        for i in 0 ..< self.section[section].movies.count {
            tableView.reloadRows(at: [IndexPath.init(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = self.section[indexPath.section].movies[indexPath.row]
        return cell
    }
    
}

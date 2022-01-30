//
//  UserGroupTableViewController.swift
//  VK
//
//  Created by Beelab on 25/01/22.
//

import UIKit


protocol UserGroupTableViewControllerDeligate {
    func setUserGroups(_ groupList: [Group])
}


class UserGroupTableViewController: UITableViewController {

    var currentUser: User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        //test user groups
        currentUser.groups.append(Group(craator: currentUser, title: "MyGroup", image: "angelina", description: ""))
        currentUser.groups.append(Group(craator: currentUser, title: "MyGroup2", image: "angelina", description: ""))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentUser.groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = currentUser.groups[indexPath.row].title
        content.image = UIImage(named: currentUser.groups[indexPath.row].image)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.contentConfiguration = content
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let targetVC = segue.destination as? AllGroupListTableViewController else { return }
        targetVC.userGroupList = currentUser.groups
        targetVC.delegate = self
        }
}

extension UserGroupTableViewController: UserGroupTableViewControllerDeligate {
    func setUserGroups(_ groupList: [Group]) {
        currentUser.groups = groupList
        tableView.reloadData()
    }
    
    
}

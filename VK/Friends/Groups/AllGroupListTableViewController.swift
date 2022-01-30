//
//  AllGroupListTableViewController.swift
//  VK
//
//  Created by Beelab on 26/01/22.
//

import UIKit

class AllGroupListTableViewController: UITableViewController {
    
    private var groupList = DataManager.shared.createTempGroups()
    var userGroupList: [Group]!
    var delegate: UserGroupTableViewControllerDeligate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        
    }
   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 1 ? groupList.count : userGroupList.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 1 ? "Рекомендованные группы" : "Состаю в группах:"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "grouplist", for: indexPath)
        var content = cell.defaultContentConfiguration()
        if indexPath.section == 1 {
            content.text = groupList[indexPath.row].title
            content.image = UIImage(named: groupList[indexPath.row].image)
        } else {
            content.text = userGroupList[indexPath.row].title
            content.image = UIImage(named: userGroupList[indexPath.row].image)
        }
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            userGroupList.append(groupList[indexPath.row])
            groupList.remove(at: indexPath.row)
        } else {
            groupList.append(userGroupList[indexPath.row])
            userGroupList.remove(at: indexPath.row)
        }
        //tableView.reloadSections([0,1], with: .automatic)
        delegate?.setUserGroups(userGroupList)
        let destinationIndexRow = indexPath.section == 0 ? IndexPath(row: groupList.count - 1, section: 1) : IndexPath(row: userGroupList.count - 1, section: 0)
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.moveRow(at: indexPath, to: destinationIndexRow)
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  FriendsTableViewController.swift
//  VK
//
//  Created by Beelab on 16/01/22.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    private let reuseIdentifier = "FriendsListTableViewCell"
    
    var currentUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        tableView.register(UINib(nibName: "FriendsListTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentUser.friendsList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? FriendsListTableViewCell else { return UITableViewCell() }
        cell.setDataForCell(user: currentUser.friendsList[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            guard let photosVC = segue.destination as? PhotosCollectionViewController else { return }
            let photoList = currentUser.friendsList[indexPath.row].photos
            photosVC.photoList = photoList
        }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toFriendsPhotos", sender: nil)
    }
    
}

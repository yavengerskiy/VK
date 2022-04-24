//
//  FriendsTableViewController.swift
//  VK
//
//  Created by Beelab on 16/01/22.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    private let reuseIdentifier = "FriendsListTableViewCell"
    private var namesListFixed: [String] = []
    private var namesListModifed: [String] = []
    private var letersOfNames: [String] = []
    
    let userList = DataManager.shared.createTempUsers()
    var currentUser: User!
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentUser = userList[5]
        print(currentUser.login)
        GetDataFromVKApi().getData(.getFriends)
        GetDataFromVKApi().getData(.getGroups)
        GetDataFromVKApi().getData(.getAllPhotos)
        GetDataFromVKApi().getData(.searchGroups)

        setup()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return letersOfNames.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var countOfRows = 0
        for name in namesListModifed {
            if letersOfNames[section].contains(name.first!) {
                countOfRows += 1
            }
        }
        return countOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? FriendsListTableViewCell else { return UITableViewCell() }
        cell.setDataForCell(user: getUserforCell(indexPath))
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            guard let photosVC = segue.destination as? PhotosCollectionViewController else { return }
            let photoList = getUserforCell(indexPath).photos
            photosVC.photoList = photoList
        }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toFriendsPhotos", sender: nil)
    }
    
}

extension FriendsTableViewController: UISearchBarDelegate {
    private func setup() {
        tableView.rowHeight = 100
        tableView.register(UINib(nibName: "FriendsListTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        searchBar.delegate = self
        makeNamesList()
        sortCharacterOfNamesAlphabet()
    }
    
    func makeNamesList() {
        namesListFixed.removeAll()
        for item in 0..<currentUser.friendsList.count {
            namesListFixed.append(currentUser.friendsList[item].name)
        }
        namesListModifed = namesListFixed
    }
    
    func sortCharacterOfNamesAlphabet() {
        var letersSet = Set<Character>()
        letersOfNames = []
        for name in namesListModifed {
            letersSet.insert(name[name.startIndex])
        }
        for leter in letersSet.sorted() {
            letersOfNames.append(String(leter))
        }
    }
    func getUserforCell(_ indexPath: IndexPath) -> User {
        var usersForSection: [User] = []
        for user in  currentUser.friendsList {
            if letersOfNames[indexPath.section].contains(user.name.first!) {
                usersForSection.append(user)
            }
        }
        return usersForSection[indexPath.row]
    }

    // MARK: - searchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        namesListModifed = searchText.isEmpty ? namesListFixed : namesListFixed.filter { (item: String) -> Bool in
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        sortCharacterOfNamesAlphabet()
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = nil
        makeNamesList()
        sortCharacterOfNamesAlphabet()
        tableView.reloadData()
        searchBar.resignFirstResponder()
    }
    
    
    // настройка хедера ячеек
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        let leter: UILabel = UILabel(frame: CGRect(x: 30, y: 5, width: 20, height: 20))
        leter.textColor = UIColor.black.withAlphaComponent(0.5)
        leter.text = letersOfNames[section]
        leter.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        header.addSubview(leter)
        
        return header
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return letersOfNames
    }
}

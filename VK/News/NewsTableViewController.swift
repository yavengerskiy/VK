//
//  NewsTableViewController.swift
//  VK
//
//  Created by Beelab on 06/02/22.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var newsList = DataManager.shared.createTestNews()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 650
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        
        // аватар
        cell.avatarForNews.avatarImage.image = UIImage(named: newsList[indexPath.row].creator.photos.first ?? "")
        // имя автора
        cell.autorLabel.text = newsList[indexPath.row].creator.name
        // дата новости
        cell.publicationDate.text = newsList[indexPath.row].date
        cell.publicationDate.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        cell.publicationDate.textColor = UIColor.gray.withAlphaComponent(0.5)
        //текст новости
        cell.newsTextLabel.text = newsList[indexPath.row].textNews
        cell.newsTextLabel.numberOfLines = 0
        //картинка к новости
        cell.newsImageView.image = UIImage(named: newsList[indexPath.row].textImage)
        cell.newsImageView.contentMode = .scaleAspectFill

        return cell
    }
    

}

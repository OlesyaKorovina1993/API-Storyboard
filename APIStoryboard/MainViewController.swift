//
//  MainViewController.swift
//  APIStoryboard
//
//  Created by user on 14.04.2021.
//

import Foundation
import UIKit

class MainViewController: UIView{
    var tableView = UITableView() //таблица
    
    override func awakeFromNib() {

        super.awakeFromNib()
        self.firstInitialization()
    }
    fileprivate func firstInitialization () {
        self.addSubview(tableView)
        
    }
    fileprivate func setupConstraints(){
        self.tableView.translatesAutoresizingMaskIntoConstraints = false //не создавать ограничения автоматически
        
        self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

    }
}

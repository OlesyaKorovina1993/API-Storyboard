//
//  ViewController.swift
//  APIStoryboard
//
//  Created by user on 13.04.2021.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating, UITableViewDataSource{
    var timer = Timer()
    
    fileprivate var contentView: MainViewController{
        return self.view as! MainViewController //возвращает view, который является MainViewController
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        super.init(nibName: "CustomView", bundle: nil)
    }
    required init?(coder aDecoder: NSCoder){
        super .init(coder: aDecoder)
    }
    
    
    override func loadView() {
        self.view = MainViewController()//работа с Xib
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()
        self.contentView.tableView.dataSource = self
        
    }
    fileprivate func setupNavigationBar(){
        self.navigationItem.title = "Weather Application"
        //включить большие заголовки на панели навигации
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        //добавим поиск
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false //скрытие панели при прокрутке отключена(false)
    }
    
    //MARK: - UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController){
        //print(searchController.searchBar.text)
        /*guard let text = searchController.searchBar.text else { return }
        print(text)*/
        
        //подключаем таймер
        let city = searchController.searchBar.text!
        timer.invalidate()
        //отключить запрос nil если в строке пусто
        if city != "" {
            timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (timer) in
                NetWorkManager.shared.getWeather(city: city, result: { (model) in
                    for list in model!.list! {
                        //print(list.main?.temp as Any)
                    }
                    //print(model as Any)
                })
            })
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    //MARK: - UITableViewDataSource

}


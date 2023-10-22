//
//  HomeViewController.swift
//  BeritaIndo
//
//  Created by Ahmad Baraas on 19/10/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableViewBeritaIndo: UITableView!
    
    var NewsList : [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        loadNews()
    }
    
    
    func setup () {
        tableViewBeritaIndo.dataSource = self
        
    }
    
    func loadNews() {
        ApiService.shared.loadLatestNews { result in
            switch result {
            case .success(let newsList):
                self.NewsList = newsList
                self.tableViewBeritaIndo.reloadData()
                print(newsList)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    


}

extension HomeViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "news_list", for: indexPath)
//        let news  = NewsList[indexPath.row]
        
//        cell.titleLabelView.text = news.title
//        cell.dateLabelView.text = news.isoDate
        
        
    
        return cell
    }
    
    
}



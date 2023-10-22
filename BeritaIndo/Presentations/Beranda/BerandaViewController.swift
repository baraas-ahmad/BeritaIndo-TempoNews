//
//  BerandaViewController.swift
//  BeritaIndo
//
//  Created by Ahmad Baraas on 19/10/23.
//

import UIKit

class BerandaViewController: UIViewController {
    @IBOutlet weak var BerandaTableView: UITableView!
    
    var newsListView: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        loadNews()
//        loadCategories()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        navigationController?.navigationBar.prefersLargeTitles = true
    }
    func setup() {
        title = "Berita Indonesia"
        BerandaTableView.dataSource = self
        BerandaTableView.delegate = self
        
        
    }
    
    func loadNews() {
        ApiService.shared.loadLatestNews { result in
            switch result {
            case .success(let newsList):
                self.newsListView = newsList
                self.BerandaTableView.reloadData()
                print(newsList)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

extension BerandaViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = newsListView[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Berita", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "BeritaViewController") as! BeritaViewController
        
        viewController.news = news
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}
extension BerandaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsListView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cella = tableView.dequeueReusableCell(withIdentifier: "news_custom_cell", for: indexPath) as! NewsViewCell
        let news = newsListView[indexPath.row]
        cella.titleNews.text = news.title
        cella.publishDateNews.text = news.isoDate
        
        
        return cella
    }
    
    
}



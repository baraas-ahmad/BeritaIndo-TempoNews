//
//  ViewController.swift
//  BeritaIndo
//
//  Created by Ahmad Baraas on 19/10/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        ApiService.shared.loadLatestNews { result in
            switch result {
            case .success(let newsList):
                print("Total :\(newsList.count)")
                print(newsList)
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
        
    }


}


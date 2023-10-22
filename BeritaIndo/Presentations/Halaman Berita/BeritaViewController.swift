//
//  BeritaViewController.swift
//  BeritaIndo
//
//  Created by Ahmad Baraas on 20/10/23.
//

import UIKit

class BeritaViewController: UIViewController {

    var news : News!
    
    @IBOutlet weak var thumbImageBerita: UIImageView!
    @IBOutlet weak var titleBeritaView: UILabel!
   
    @IBOutlet weak var contentBerita: UILabel!
    
    @IBOutlet weak var authorDate: UILabel!
    @IBOutlet weak var linkButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    

    func setup () {
        titleBeritaView.text = news.title
        thumbImageBerita.layer.cornerRadius = 4
        thumbImageBerita.layer.masksToBounds = true
        thumbImageBerita.image = UIImage(named: "img_detail")
        contentBerita.text = news.content

      
        
        
        let strDate = news.isoDate
        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//        let myDate = dateFormatter.date(from: strDate)
//        dateFormatter.dateFormat = "MMM dd, YYYY"
//        let str = dateFormatter.string(from:myDate )
//       
        
        authorDate.text = "Abi Hosein • \(strDate)"
        
        
        
    }

}

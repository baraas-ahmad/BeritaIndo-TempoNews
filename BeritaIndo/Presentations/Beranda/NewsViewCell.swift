//
//  NewsViewCell.swift
//  BeritaIndo
//
//  Created by Ahmad Baraas on 19/10/23.
//

import UIKit

class NewsViewCell: UITableViewCell {

    @IBOutlet weak var thumbImageNews: UIImageView!
    @IBOutlet weak var titleNews: UILabel!
    
    @IBOutlet weak var authorNews: UILabel!
    @IBOutlet weak var publishDateNews: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup () {
        
        thumbImageNews.layer.cornerRadius = 4
        thumbImageNews.layer.masksToBounds = true
        thumbImageNews.image = UIImage(named: "img_news")
        authorNews.text = "Abi Hosein"
        
    }

}

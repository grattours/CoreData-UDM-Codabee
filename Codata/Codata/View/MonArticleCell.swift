//
//  AppDelegate.swift
//  Codata
//
//  Created by Luc Derosne on 28/11/2018.
//  Copyright © 2018 Luc Derosne. All rights reserved.
//


import UIKit

class MonArticleCell: UITableViewCell {

    @IBOutlet weak var articleIV: UIImageView!
    @IBOutlet weak var dateLBL: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var shopLbl: UILabel!
    
    var article: Article!
    
    func setup(_ article: Article) {
        self.article = article
        nameLbl.text = self.article.name
        if let shop = self.article.shop {
            shopLbl.text = "Magasin: " + shop
        } else {
            shopLbl.text = ""
        }
        if let date = self.article.date {
            dateLBL.text = date.toString()
        }
        priceLbl.text = "Prix: \(self.article.prix) €"
        articleIV.image = self.article.image as? UIImage
    }
    
    
    @IBAction func deleteArticle(_ sender: Any) {
        CoreDataHelper().deleteArticle(self.article)
    }
    
}

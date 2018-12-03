//
//  AppDelegate.swift
//  Codata
//
//  Created by Luc Derosne on 28/11/2018.
//  Copyright © 2018 Luc Derosne. All rights reserved.
//


import UIKit

class ListeCell: UITableViewCell {

    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    var liste: Liste!
    
    func setupCell(liste: Liste) {
        self.liste = liste
        nameLBL.text = self.liste.name
        if self.liste.date != nil {
            dateLbl.text = "Créé le " + self.liste.date!.toString()

        } else {
            dateLbl.text = "Aucune date disponible"
        }
    }
    
}

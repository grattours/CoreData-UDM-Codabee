//
//  AppDelegate.swift
//  Codata
//
//  Created by Luc Derosne on 28/11/2018.
//  Copyright © 2018 Luc Derosne. All rights reserved.
//


import UIKit

let articleCell = "MonArticleCell"

class ArticleController: UIViewController {

    var liste: Liste!
    var articles: [Article] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: articleCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: articleCell)
        
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: Notification.Name("delete"), object: nil)
    }
    
    @objc func reload() {
        if let articles = liste.article?.allObjects as? [Article] {
            self.articles = articles
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reload()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Add", let controller = segue.destination as? AddArticleController {
            controller.liste = liste
        }
    }
    
    @IBAction func add(_ sender: Any) {
        performSegue(withIdentifier: "Add", sender: nil)
    }
}


extension ArticleController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: articleCell) as? MonArticleCell {
            cell.setup(articles[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

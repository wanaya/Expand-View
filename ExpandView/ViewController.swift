//
//  ViewController.swift
//  ExpandView
//
//  Created by Guillermo Anaya Magallón on 05/12/14.
//  Copyright (c) 2014 wanaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var data = ["One", "two", "Bla", "Mhew", "One", "two", "Bla", "Mhew", "One", "two", "Bla", "Mhew", "One", "two", "Bla", "Mhew", "One", "two", "Bla", "Mhew", "One"]
    
    private var detailView = DetailView()
    private var height = CGFloat(235.0)
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.registerClass(TableViewCell.self, forCellReuseIdentifier: "cell")
        self.table.rowHeight = UITableViewAutomaticDimension
        
    }
    
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:TableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as TableViewCell
        cell.customLabel.text = self.data[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.height
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.addChildViewController(self.detailView)
        self.detailView.view.frame = self.table.rectForRowAtIndexPath(indexPath)
        self.detailView.view.center = CGPointMake(self.detailView.view.center.x, self.detailView.view.center.y - self.table.contentOffset.y)
        self.detailView.frameToClose = self.detailView.view.frame
        self.detailView.customLabel.text = self.data[indexPath.row]
        
        self.view.addSubview(self.detailView.view)
        
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: nil, animations: { () -> Void in
            self.detailView.view.frame = self.table.frame
        }) { (Bool) -> Void in
            self.detailView.didMoveToParentViewController(self)
        }
    }
}

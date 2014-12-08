//
//  DetailView.swift
//  ExpandView
//
//  Created by Guillermo Anaya Magallón on 08/12/14.
//  Copyright (c) 2014 wanaya. All rights reserved.
//

import UIKit

class DetailView: UIViewController {
    
    let customLabel = UILabel(frame: CGRectZero)
    var frameToClose = CGRectZero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        
        
        customLabel.frame = CGRectMake(80, 80, 200, 50)
        self.view.addSubview(customLabel)
        
        let closeButton = UIButton(frame: CGRectMake(0, 20, 80, 33))
        closeButton.setTitle("Close", forState: .Normal)
        closeButton.addTarget(self, action: "closeButton:", forControlEvents: .TouchUpInside)
        closeButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        self.view.addSubview(closeButton)
    }
    
    func closeButton(sender: UIButton) {
        self.willMoveToParentViewController(nil)
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: nil, animations: { () -> Void in
            self.view.frame = self.frameToClose
        }) { (Bool) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        }
    }

}

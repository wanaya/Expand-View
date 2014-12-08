//
//  TableViewCell.swift
//  ExpandView
//
//  Created by Guillermo Anaya Magallón on 08/12/14.
//  Copyright (c) 2014 wanaya. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    let customLabel = UILabel(frame: CGRectZero)
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        customLabel.frame = CGRectMake(80, 80, 200, 50)
        customLabel.text = "Hola"
        self.addSubview(customLabel)
        
        
        var bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.whiteColor()
        self.selectedBackgroundView = bgColorView
    }

}

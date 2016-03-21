//
//  RuleViewController.swift
//  Hang man
//
//  Created by Quang on 2/10/16.
//  Copyright © 2016 Quang Vu. All rights reserved.
//

import UIKit

class RuleViewController: UIViewController{
    
    @IBOutlet weak var myImageView: UIImageView!
    var imageFileName: String!
    var pageIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImageView.image = UIImage(named: imageFileName)
    }
    
    
}
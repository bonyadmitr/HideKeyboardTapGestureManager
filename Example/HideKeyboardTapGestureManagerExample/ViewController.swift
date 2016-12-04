//
//  ViewController.swift
//  HideKeyboardTapGestureManagerExample
//
//  Created by Bondar Yaroslav on 04.12.16.
//  Copyright © 2016 Bondar Yaroslav. All rights reserved.
//

import UIKit
import HideKeyboardTapGestureManager

class ViewController: UIViewController {
    
    @IBOutlet var hideKeyboardTapGestureManager: HideKeyboardTapGestureManager!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var middleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardTapGestureManager.add(targets: [leftView])
        
        // will give HideKeyboardTapGestureManager Warning
        hideKeyboardTapGestureManager.remove(targets: [middleView])
        
//        hideKeyboardTapGestureManager.removeAllTargets()
    }
}

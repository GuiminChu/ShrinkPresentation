//
//  MenuViewController.swift
//  ShrinkPresentationDemo
//
//  Copyright © 2015 GuiminChu All rights reserved.
//

import UIKit

class MenuViewController: ShrinkViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

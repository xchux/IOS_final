//
//  ViewController.swift
//  lei
//
//  Created by chu on 11/6/16.
//  Copyright © 2016 chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var UserTextField: UITextField!
    
    @IBOutlet weak var UserSexal: UISegmentedControl!
    
    
    @IBOutlet weak var SiderNumber: UILabel!
    @IBOutlet weak var silder: UISlider!
    
    @IBAction func UserSilder(_ sender: Any) {
        let currentvalue=silder.value
        SiderNumber.text="\(currentvalue)"
    
    }
    @IBOutlet weak var introTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


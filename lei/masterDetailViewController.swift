//
//  masterDetailViewController.swift
//  lei
//
//  Created by user_04 on 2017/1/7.
//  Copyright © 2017年 chu. All rights reserved.
//

import UIKit

class masterDetailViewController: UIViewController {
    var masterInfoDic:[String:String]!
    @IBOutlet weak var masterImageView: UIImageView!
    
    @IBOutlet weak var interduction: UITextView!
    @IBOutlet weak var sexLabel: UILabel!
    var index = 0
    var master = [[String:String]]()
    @IBOutlet weak var face: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("\(masterInfoDic["name"]!).png")
        // Configure the cell...
        
        face.image = UIImage(contentsOfFile: url!.path)

        interduction.text = "你好"+masterInfoDic["name"]!+" 歡迎你當寵物的主人記得常常來看看他們（點開app)喲～😘"
        sexLabel.text = masterInfoDic["sex"]!
        self.navigationItem.title = masterInfoDic["name"]!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

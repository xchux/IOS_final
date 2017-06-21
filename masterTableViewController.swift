//
//  masterTableViewController.swift
//  lei
//
//  Created by user_04 on 2017/1/7.
//  Copyright © 2017年 chu. All rights reserved.
//

import UIKit

class masterTableViewController: UITableViewController {

    var isAddmaster = false
    
    var masters = [[String:String]]()

    override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if isAddmaster {
    isAddmaster = false
    let indexPath = IndexPath(row: 0, section: 0)
    self.tableView.insertRows(at: [indexPath], with: .automatic)
    
    }
    }
   
    func updateFile() {
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("masters.txt")
        print("url \(url)")
        let result = (masters as NSArray).write(to: url!, atomically: true)
        print("result \(result)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addmasterNoti(noti:Notification) {
        let dic = noti.userInfo as! [String:String]
        masters.insert(dic, at: 0)
        updateFile()
        isAddmaster = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("masters.txt")
        let array = NSArray(contentsOf: url!)
        if array != nil {
            masters = array as! [[String:String]]
        }
        
        
        let notiName = Notification.Name("addmaster")
        NotificationCenter.default.addObserver(self, selector: #selector(masterTableViewController.addmasterNoti(noti:)), name: notiName, object: nil)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete /Users/user_04/Desktop/lei/masterTableViewCell.swiftimplementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return masters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MasterCell", for: indexPath) as! masterTableViewCell
        let dic = masters[indexPath.row]
        
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("\(dic["name"]!).png")
        // Configure the cell...
        
        cell.photoImageView.image = UIImage(contentsOfFile: url!.path)
        
        cell.nameLabel.text = dic["name"]
        cell.starImageView.image = UIImage(named: dic["sex"]!)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        masters.remove(at: indexPath.row)
        updateFile()
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        
            
 
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showDetail" {
            let indexPath = self.tableView.indexPathForSelectedRow
            let dic:[String:String]
            dic = masters[indexPath!.row]
            
            
            let controller = segue.destination as! masterDetailViewController
            controller.masterInfoDic = dic
            controller.index=indexPath!.row
            controller.master = masters
        }
    }

}

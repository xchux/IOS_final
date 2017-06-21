//
//  addmasterTableViewController.swift
//  lei
//
//  Created by user_04 on 2017/1/7.
//  Copyright © 2017年 chu. All rights reserved.
//

import UIKit

class addmasterTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var selectPhotoBut: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sexTextField: UITextField!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        selectPhotoBut.setBackgroundImage(image, for: .normal)
        selectPhotoBut.setTitle(nil, for: .normal)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectPhoto(_ sender: Any) {
        
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = self
        present(controller, animated: true, completion: nil)
        
    }

    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var silder: UISlider!
    
    //拉條
    @IBAction func UserSilder(_ sender: Any) {
        let currentvalue=silder.value
        ageLabel.text="\(Int(currentvalue))"
        
    }   
    @IBAction func done(_ sender: Any) {
        
        if nameTextField.text!.characters.count  == 0 || sexTextField.text!.characters.count == 0 {
            let controller = UIAlertController(title: "錯誤", message: "有欄位尚未填寫", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
            return
        }
        let image = selectPhotoBut.backgroundImage(for: .normal)
        let data = UIImagePNGRepresentation(image!)
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("\(nameTextField.text!).png")
        try? data?.write(to: url!)
        let notiName = Notification.Name("addmaster")
        if sexTextField.text!=="男"||sexTextField.text!=="man"||sexTextField.text!=="male"{
            let dic = ["name":nameTextField.text!,
                   "sex":"man",
                   "age":ageLabel.text!
                   ]
            print("aa")
            NotificationCenter.default.post(name: notiName, object: nil, userInfo: dic)
        }else{
            let dic = ["name":nameTextField.text!,
                       "sex":"girl",
                       "age":ageLabel.text!]
            print("bb")

            NotificationCenter.default.post(name: notiName, object: nil, userInfo: dic)
        }
        
         _ = self.navigationController?.popViewController(animated: true)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

}

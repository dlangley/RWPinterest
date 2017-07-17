//
//  DetailVC.swift
//  Pinterest
//
//  Created by Dwayne Langley on 7/15/17.
//  Copyright © 2017 Razeware LLC. All rights reserved.

/***********************************************************************
         JUST ADDED ANOTHER SCENE... NOT A PART OF THE TUTORIAL...
 ***********************************************************************/


import UIKit

class DetailVC: UIViewController {

  @IBOutlet var image: UIImageView!
  @IBOutlet var label: UILabel!
  
  override func viewDidLoad() {
        super.viewDidLoad()

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

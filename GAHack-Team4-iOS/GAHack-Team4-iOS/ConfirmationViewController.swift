//
//  ConfirmationViewController.swift
//  GAHack-Team4-iOS
//
//  Created by Loris Mazloum on 10/28/16.
//  Copyright © 2016 Maz Labs. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let priority = DispatchQueue.GlobalQueuePriority.default
    
   dispatch_async
    
//    dispatch_async(dispatch_get_global_queue(priority, 0)) {
//    // do some task
//    dispatch_async(dispatch_get_main_queue()) {
//    // update some UI
//    }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

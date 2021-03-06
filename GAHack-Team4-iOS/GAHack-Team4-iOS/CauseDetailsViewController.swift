//
//  CauseDetailsViewController.swift
//  GAHack-Team4-iOS
//
//  Created by Loris Mazloum on 10/28/16.
//  Copyright © 2016 Maz Labs. All rights reserved.
//

import UIKit

class CauseDetailsViewController: UIViewController {
    
    var cause: Cause?
    
    @IBOutlet weak var causeImage: UIImageView!
    
    @IBOutlet weak var causeName: UILabel!
    
    @IBOutlet weak var causeDescription: UITextView!
    
    @IBAction func investButtonTapped(_ sender: UIButton) {
    
    performSegue(withIdentifier: "ToInvest", sender: self)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let cause = cause else { return }
        
        causeName.text = cause.name
        causeImage.image = UIImage(named: cause.imageUrl)
        
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

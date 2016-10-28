//
//  CauseViewController.swift
//  GAHack-Team4-iOS
//
//  Created by Loris Mazloum on 10/28/16.
//  Copyright © 2016 Maz Labs. All rights reserved.
//

import UIKit

class CauseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Variables
    var causes:[Cause] = []
    
    //MARK: Outlets
    @IBOutlet weak var causeTableView: UITableView!
    
    
    //MARK: App lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        causeTableView.delegate = self
        causeTableView.dataSource = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return causes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "causeCell", for: indexPath)
        
        // Configure the cell...
        
        return cell
    }
    
    

}


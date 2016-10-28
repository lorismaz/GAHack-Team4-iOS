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
    var selectedCause: Cause? = nil
    
    //MARK: Outlets
    @IBOutlet weak var causeTableView: UITableView!
    
    
    //MARK: App lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        causeTableView.delegate = self
        causeTableView.dataSource = self
        
        reload()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //The Main OperationQueue is where any UI changes or updates happen
    private let main = OperationQueue.main
    
    //The Async OperationQueue is where any background tasks such as
    //Loading from the network, and parsing JSON happen.
    //This makes sure the Main UI stays sharp, responsive, and smooth
    private let async: OperationQueue = {
        //The Queue is being created by this closure
        let operationQueue = OperationQueue()
        //This represents how many tasks can run at the same time, in this case 8 tasks
        //That means that we can load 8 images at a time
        operationQueue.maxConcurrentOperationCount = 8
        return operationQueue
    }()
    
    func reload() {
        
        async.addOperation {
            
            let sharedSession = URLSession.shared
            let url = URL(string: "http://kevinpagtakhan.com/ga-hack/api/causes")
            let completionHandler: (Data?, URLResponse?, Error?) -> Void = { data, response, error in
                // This code will handle the response.
                // It will run later, when the response comes in.
                guard error == nil else { print("error 1"); return }
                guard let responseData = data else { print("error 2"); return }
                
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: responseData, options:
                        JSONSerialization.ReadingOptions.allowFragments)
                    
                    guard let causesArray = jsonObject as? NSArray else { print("error 3"); return }
                    var causes: [Cause] = []
                    
                    for cause in causesArray {
                        
                        guard let causesDictionary = cause as? NSDictionary else { print("error 4");  return }
                        
                        if let newCause = Cause.fromDictionary(dictionary: causesDictionary) {
                            causes.append(newCause)
                        }
                        
                    }
                    
                    let jsonString = String(describing: jsonObject)
                    print("RESPONSE JSON: \(jsonString)")
                    
                    DispatchQueue.main.async {
                        // do something in the main queue
                        self.causes = causes
                        self.causeTableView.reloadData()
                    }
                    
                } catch { return }
                
            }
            
            guard let validURL = url else { return }
            let dataTask = sharedSession.dataTask(with: validURL, completionHandler: completionHandler)
            
            dataTask.resume()
            
        }
        
    }
    
    
    //MARK: TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return causes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "causeCell", for: indexPath) as? CauseCell else {return UITableViewCell()}
        
        let row = indexPath.row
        
        //describe cause
        let name = causes[row].name
        //let description = causes[row].description
        let image = causes[row].imageUrl
        //array
        //let organizations = causes[row].organizations
        
        cell.causeNameLabel.text = name
        cell.causeImage.image = UIImage(named: image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        let cause = causes[row]
        self.selectedCause = cause
        
        performSegue(withIdentifier: "ToCauseDetails", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            guard let cause = self.selectedCause else { return }
        
            let destinationViewController = segue.destination as! CauseDetailsViewController
        
        
        
            destinationViewController.cause = cause
        
    }
    
}


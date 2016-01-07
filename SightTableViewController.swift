//
//  SightTableViewController.swift
//  SightsTracker
//
//  Created by Admin on 04.01.16.
//  Copyright © 2016 ru.b00blik. All rights reserved.
//

import UIKit

class SightTableViewController: UITableViewController {
    
    //MARK: Properties
    var sights = [Sight]()
    
    
    @IBAction func unwindToSightList(sender: UIStoryboardSegue){
        
        if let sourceViewController = sender.sourceViewController as?
            ViewController, sight = sourceViewController.sight{
        
        let newIndexPath = NSIndexPath(forRow: sights.count, inSection: 0)
        sights.append(sight)
        tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loadSimpleSights()
    }
    
    func loadSimpleSights(){
        let photo1 = UIImage(named: "place1")!
        let sight1 = Sight(name: "Moscow Kremlin", photo: photo1, rating: 3)!
        
        let photo2 = UIImage(named: "place2")!
        let sight2 = Sight(name: "Trinity-Izmailovsky Cathedral", photo: photo2, rating: 5)!
        
        let photo3 = UIImage(named: "place3")!
        let sight3 = Sight(name: "Kazan Cathedral", photo: photo3, rating: 4)!
        
        sights += [sight1, sight2, sight3];
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sights.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "SightTableViewCell"
        let sight = sights[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SightTableViewCell
        
        cell.nameLabel.text = sight.name
        cell.photoImageView.image = sight.photo
        cell.ratingControl.rating = sight.rating

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
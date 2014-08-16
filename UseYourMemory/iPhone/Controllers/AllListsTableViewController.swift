//
//  AllListsTableViewController.swift
//  UseYourMemory
//
//  Created by Krzysiek on 14.08.2014.
//  Copyright (c) 2014 EnterPoint. All rights reserved.
//

import UIKit
import CoreData

class AllListsTableViewController: UITableViewController {

    var myLists: Array<AnyObject> = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool)  {
        // Reference to our app delegate
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        // Reference moc (ManagedObjectContext)
        let context: NSManagedObjectContext = appDelegate.managedObjectContext
        let listFetchRequest = NSFetchRequest(entityName: "List")
        
        self.myLists = context.executeFetchRequest(listFetchRequest, error: nil)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // #pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        
        return self.myLists.count
    }

    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
        
        let cellId: NSString = "Cell"
        var cell: AllListTableViewCell = tableView?.dequeueReusableCellWithIdentifier(cellId) as AllListTableViewCell
        
        if let ip = indexPath {
            var data: NSManagedObject = self.myLists[ip.row] as NSManagedObject
            cell.setCell(data.valueForKeyPath("name") as String)
        }

        return cell
    }
    

    
    override func tableView(tableView: UITableView?, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            if let ip = indexPath {
                var listToDelete: ListModel = self.myLists.removeAtIndex(ip.row) as ListModel
                self.tableView.deleteRowsAtIndexPaths([ip], withRowAnimation: .Fade)
                
                // Reference to our app delegate
                let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
                
                // Reference moc (ManagedObjectContext)
                let context: NSManagedObjectContext = appDelegate.managedObjectContext
                
                context.deleteObject(listToDelete)
                context.save(nil)
            }
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    



    /*
    override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView?, moveRowAtIndexPath fromIndexPath: NSIndexPath?, toIndexPath: NSIndexPath?) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView?, canMoveRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}

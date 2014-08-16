//
//  ListViewController.swift
//  UseYourMemory
//
//  Created by Krzysiek on 14.08.2014.
//  Copyright (c) 2014 EnterPoint. All rights reserved.
//

import UIKit
import CoreData

class ListViewController: UIViewController {

    @IBOutlet var textFieldName : UITextField
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveTapped(sender : AnyObject) {
        
        if self.textFieldName.text != "" {
        
            // Reference to our app delegate
            let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
            // Reference moc (ManagedObjectContext)
            let context: NSManagedObjectContext = appDelegate.managedObjectContext
            let listEntity = NSEntityDescription.entityForName("List", inManagedObjectContext: context)
        
            // Create instance of pur data model and initialize
            var newList = ListModel(entity: listEntity, insertIntoManagedObjectContext: context)
        
            // Map our properties
            newList.name = self.textFieldName.text
        
            // Save our context
            context.save(nil)
        
            // Navigate back to root vc
            self.navigationController.popToRootViewControllerAnimated(true)
        } else {
            var alert = UIAlertController(title: "Uwaga", message: "Pole nazwa nie może być puste", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)


        }
    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        // Navigate back to root vc
        self.navigationController.popToRootViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

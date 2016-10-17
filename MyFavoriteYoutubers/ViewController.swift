//
//  ViewController.swift
//  MyFavoriteYoutubers
//
//  Created by cis290 on 10/12/16.
//  Copyright © 2016 Rock Valley College. All rights reserved.
//

import UIKit

import CoreData

class ViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var youtuberName: UITextField!
    
    @IBOutlet weak var realName: UITextField!
    
    @IBOutlet weak var youtubeURL: UITextField!
    
    @IBOutlet weak var twitter: UITextField!
    
    @IBOutlet weak var gender: UITextField!

    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var btnSave: UIButton!
    //end outlets
    
    //actions
    @IBAction func btnSave(sender: AnyObject) {
        
        if (youtuberdb != nil)
        {
            
            youtuberdb.setValue(youtuberName.text, forKey: "youtuberName")
            youtuberdb.setValue(realName.text, forKey: "realName")
            youtuberdb.setValue(youtubeURL.text, forKey: "youtubeURL")
            youtuberdb.setValue(twitter.text, forKey: "twitter")
            youtuberdb.setValue(gender.text, forKey: "gender")
        }
        else
        {
            let entityDescription =
                NSEntityDescription.entityForName("Youtuber",inManagedObjectContext: managedObjectContext)
            
            let youtuber = Youtuber(entity: entityDescription!,
                                  insertIntoManagedObjectContext: managedObjectContext)
            
            youtuber.youtuberName = youtuberName.text!
            youtuber.realName = realName.text!
            youtuber.youtubeURL = youtubeURL.text!
            youtuber.twitter = twitter.text!
            youtuber.gender = gender.text!
        }
        var error: NSError?
        do {
            try managedObjectContext.save()
        }
        catch let error1 as NSError {
            error = error1
        }
        if let err = error {
            status.text = err.localizedFailureReason
        }
        else {
            self.dismissViewControllerAnimated(false, completion: nil)
        }
        
    }
    @IBAction func btnBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    //end actions
    
     let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var youtuberdb:NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (youtuberdb != nil)
        {
            youtuberName.text = youtuberdb.valueForKey("youtuberName") as? String
            realName.text = youtuberdb.valueForKey("realName") as? String
            youtubeURL.text = youtuberdb.valueForKey("youtubeURL") as? String
            twitter.text = youtuberdb.valueForKey("twitter") as? String
            gender.text = youtuberdb.valueForKey("gender") as? String
            btnSave.setTitle("Update", forState: UIControlState.Normal)
        }
        youtuberName.becomeFirstResponder()
        // Do any additional setup after loading the view.
        //Looks for single or multiple taps
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.DismissKeyboard))
        //Adds tap gesture to view
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches , withEvent:event)
        if (touches.first as UITouch!) != nil {
            DismissKeyboard()
        }
    }
    func DismissKeyboard(){
        //forces resign first responder and hides keyboard
        youtuberName.endEditing(true)
        realName.endEditing(true)
        youtubeURL.endEditing(true)
        twitter.endEditing(true)
        gender.endEditing(true)
    }
    func textFieldShouldReturn(textField: UITextField!) -> Bool     {
        textField.resignFirstResponder()
        return true;
    }
}
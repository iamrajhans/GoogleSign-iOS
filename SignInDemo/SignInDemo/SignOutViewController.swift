//
//  SignOutViewController.swift
//  SignInDemo
//
//  Created by Rajhans Jadhao on 18/08/16.
//  Copyright © 2016 Rajhans Jadhao. All rights reserved.
//

import UIKit

class SignOutViewController: UIViewController ,GIDSignInUIDelegate{

    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var emailAddress: UILabel!
    @IBOutlet weak var username: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        if GIDSignIn.sharedInstance().hasAuthInKeychain() {
            let user = GIDSignIn.sharedInstance().currentUser
            emailAddress?.text = user.profile?.email
            username?.text = user.profile?.name
            
//            if let url = NSURL(string: "\(user.profile?.imageURLWithDimension(100) )"){
//                if let data = NSData(contentsOfURL: url) {
//                    self.userProfileImage.image = UIImage(data: data)
//                }
//            }
            
            
            print("\(user.profile?.name)")
            print("\(user.profile?.email)")
            print("\(user.profile?.imageURLWithDimension(100))")
        }
        // Do any additional setup after loading the view.
        
    }
    
    

    
   
    @IBAction func SignOutButton(sender: AnyObject) {
        
        GIDSignIn.sharedInstance().signOut()
        
        let signInPage = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        let signInPageNav = UINavigationController(rootViewController: signInPage)
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = signInPageNav
        
        

    }
}

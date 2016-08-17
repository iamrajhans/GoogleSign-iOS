//
//  SignOutViewController.swift
//  SignInDemo
//
//  Created by Rajhans Jadhao on 18/08/16.
//  Copyright © 2016 Rajhans Jadhao. All rights reserved.
//

import UIKit

class SignOutViewController: UIViewController ,GIDSignInUIDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

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

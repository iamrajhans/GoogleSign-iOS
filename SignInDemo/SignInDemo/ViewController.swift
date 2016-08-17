//
//  ViewController.swift
//  SignInDemo
//
//  Created by Rajhans Jadhao on 15/08/16.
//  Copyright © 2016 Rajhans Jadhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,GIDSignInUIDelegate{

    
    @IBOutlet weak var SignInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
    }

    func signIn(signIn: GIDSignIn!, presentViewController viewController: UIViewController!) {
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    func signIn(signIn: GIDSignIn!, dismissViewController viewController: UIViewController!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
        //
    }
    
}


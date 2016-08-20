//
//  SignOutViewController.swift
//  SignInDemo
//
//  Created by Rajhans Jadhao on 18/08/16.
//  Copyright © 2016 Rajhans Jadhao. All rights reserved.
//

import UIKit

class SignOutViewController: UIViewController ,GIDSignInUIDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var emailAddress: UILabel!
    @IBOutlet weak var username: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if GIDSignIn.sharedInstance().hasAuthInKeychain() {
            let user = GIDSignIn.sharedInstance().currentUser
            emailAddress?.text = user.profile?.email
            username?.text = user.profile?.name
            print("\(user.profile?.name)")
            print("\(user.profile?.email)")
            print("\(user.profile?.imageURLWithDimension(100))")
//            if let url = NSURL(string: "\(user.profile?.imageURLWithDimension(100) )"){
//                userProfileImage.contentMode = .ScaleAspectFit
//                downloadImage(url)
//                
//            }
            
        }
        // Do any additional setup after loading the view.
        
    }
    
    
    func downloadImage(url:NSURL){
        getDataFromUrl(url) {(data,response,error) in
            dispatch_async(dispatch_get_main_queue()){ () -> Void in
                guard let data = data where error == nil else { return }
                self.userProfileImage?.image = UIImage(data: data)
                
            }
        }
    }
    
    @IBAction func selectImagefromLibrary(sender: UITapGestureRecognizer) {
        print("in image controller")
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .Camera
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // MARK: UIImagePickerControllerDelegate
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // called when we select the image
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        // get the selected image from photolibrary
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //set selected image
        userProfileImage.image = selectedImage
        
        //dismiss the picker
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func getDataFromUrl(url:NSURL,completion : ((data:NSData?,response:NSURLResponse?,error:NSError?) -> Void)){
        NSURLSession.sharedSession().dataTaskWithURL(url){(data,response,error) in
            completion(data: data, response: response, error: error)
            }.resume()
        
    }
    
    
    
    
    @IBAction func SignOutButton(sender: AnyObject) {
        
        GIDSignIn.sharedInstance().signOut()
        
        let signInPage = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        let signInPageNav = UINavigationController(rootViewController: signInPage)
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = signInPageNav
        
        
        
    }
}

//
//  ViewController.swift
//  SignInDemo
//
//  Created by Rajhans Jadhao on 15/08/16.
//  Copyright © 2016 Rajhans Jadhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,GIDSignInUIDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    
    
    @IBOutlet weak var actionsheetBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var SignInButton: GIDSignInButton!
    
    @IBAction func selectPhoto(sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion:nil)
        
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        imageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func takePhoto(sender: UIButton) {
        let takePic = UIImagePickerController()
        takePic.delegate = self
        takePic.sourceType = UIImagePickerControllerSourceType.Camera
        presentViewController(takePic, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GIDSignIn.sharedInstance().uiDelegate = self
        load_image("https://lh3.googleusercontent.com/-kkdLLOyn4-g/AAAAAAAAAAI/AAAAAAAAGvw/ooj6qPYe3Ds/s100/photo.jpg")
    }
    
    func load_image(urlString:String)
    {
        let imgURL: NSURL = NSURL(string: urlString)!
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(),completionHandler: {(response: NSURLResponse?,data: NSData?,error: NSError?) -> Void in
            if error == nil {
                self.imageView.image = UIImage(data: data!)
            }
        })
        
    }
    
    @IBAction func actionSheetButton(sender: UIBarButtonItem) {
        // Action sheet popup
        let alert = UIAlertController(title: "Action sheet ", message: "This is desc for action sheet", preferredStyle: UIAlertControllerStyle.ActionSheet)
        // for ipad to show popup 
        alert.modalPresentationStyle = .Popover
        let ppc = alert.popoverPresentationController
        ppc?.barButtonItem = actionsheetBarButtonItem
        
        
        alert.addAction(UIAlertAction(
            title: "Test", style: UIAlertActionStyle.Default)
            { (action: UIAlertAction) -> Void in
            
            })
        
        alert.addAction(UIAlertAction(
        title: "Test 2",style: .Default){
            (action: UIAlertAction) -> Void in
            
            })
        
        alert.addAction(UIAlertAction(title: "Red",style: .Destructive){
            (action: UIAlertAction) -> Void in
            
            })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel){
            (action: UIAlertAction) -> Void in
            
            })
        presentViewController(alert, animated: true, completion: nil)

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


//
//  ProfileViewController.swift
//  Chatter
//
//  Created on 2/23/15.
//  
//
/*
The MIT License (MIT)

Copyright (c) 2015 Eddy Borja

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import UIKit
import Parse

class ProfileViewController : UIViewController {
    
    @IBOutlet weak var profilePhoto: UIImageView!
    
    override func viewDidLoad() {
        
        var facebookId = PFUser.currentUser().objectForKey("facebookId") as String
        var imageURLString = "http://graph.facebook.com/" + facebookId + "/picture?type=large"
        var imageURL = NSURL(string: imageURLString)
        profilePhoto.sd_setImageWithURL(imageURL)
        
    }
    
    
    @IBAction func unwindToProfile(segue : UIStoryboardSegue){
        
        var svc = slidingViewController()
        if svc.currentTopViewPosition == ECSlidingViewControllerTopViewPosition.Centered {
            svc.anchorTopViewToRightAnimated(true)
        } else {
            svc.resetTopViewAnimated(true)
        }
    }
    
    @IBAction func logout(sender : AnyObject) {

        performSegueWithIdentifier("logout", sender: self)
    }
    
}
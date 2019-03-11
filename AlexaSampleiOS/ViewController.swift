//
//  ViewController.swift
//  AlexaSampleiOS
//
//  Created by Lawrence Gimenez on 21/08/2018.
//  Copyright © 2018 Livin' Ideas. All rights reserved.
//

import UIKit
import LoginWithAmazon

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        // Build an authorize request.
        let authorizeRequest = AMZNAuthorizeRequest.init()
        authorizeRequest.scopes = [
            AMZNProfileScope.userID()
        ]
        authorizeRequest.grantType = AMZNAuthorizationGrantType.token
        // Make an Authorize call to the Login with Amazon SDK.
        AMZNAuthorizationManager.shared().authorize(authorizeRequest, withHandler: {
            result, userDidCancel, error in
            if error != nil {
                // Handle errors from the SDK or authorization server.
            } else if userDidCancel {
                // Handle errors caused when user cancels login.
                print("user cancelled")
            } else {
                // Authentication was successful.
                // Obtain the access token and user profile data.
                let accessToken = result?.token
                print("Access token = \(accessToken!)")
            }
        })
    }
}


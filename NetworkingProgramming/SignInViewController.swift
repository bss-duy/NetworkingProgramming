//
//  SignInViewController.swift
//  NetworkingProgramming
//
//  Created by Duy Nguyen on 6/22/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Alamofire
import AlamofireActivityLogger
import ObjectMapper

class SignInViewController: UIViewController {

    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: Any) {
        let activityData = ActivityData()
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
        
        Alamofire.request( "http://ibss.io:5599/api/token" , method: .post, parameters: ["grant_type" : "password","username" : tfUsername.text!, "password" : tfPassword.text!], encoding: URLEncoding.default, headers : ["Accept" : "application/vnd.app.atoms.mobile-v1+json"]).log(level: .all, options: [.onlyDebug, .jsonPrettyPrint, .includeSeparator])
            .responseJSON { (response) in
        
                NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
                
                if let statusCode = response.response?.statusCode {
                    print("STATUS CODE \(statusCode)")
                }
                
                switch response.result {
                case .failure(let error) :
                    print(error)
                case .success(let responseObject) :
                    if let apiResponse = Mapper<Token>().map(JSONObject: responseObject) {
                        print(apiResponse.description)
                    }
                }
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

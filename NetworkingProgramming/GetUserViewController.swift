//
//  GetUserViewController.swift
//  NetworkingProgramming
//
//  Created by Duy Nguyen on 6/22/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import ObjectMapper
import AlamofireActivityLogger
import Alamofire

class GetUserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getUser(_ sender: Any) {
        let activityData = ActivityData()
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
        
        
        Alamofire.request( "http://ibss.io:5599/api/users/current" , method: .get, parameters: nil, encoding: URLEncoding.queryString, headers : ["Accept" : "application/vnd.app.atoms.mobile-v1+json", "Authorization" : "Bearer 3_jBEibtrcFVdGPwusakrFlemRs4KszIetOkDMy1NQM-pxIk46IMM5uhElZAtak4kiJkuWHPIu4uiOmJ0Jsh28qhMa44L4XIiI0YBv6_5PnbXDmwwavGyiI2rR73DQJXAGfqkaTISNY-nEOKa-2OcxP9NdsuzDiv5fsYRDr3_teLJ0_8_hgFa14y7dBRT5EKOF4tIrbDEwqagXjHaoNPZwZDqLvYtWz5hgL2apR1ln7Nb-4fClPQQhFiY3uhynARThtfQ9aHScwzFTf7AiLa0dzV4tdcJz0KDk--32t7vLn1Tfl0QVXIaWdcRIiQe1GpmvZd1sQo5Ubb186Vk2-133R-hK7PncbQ19Rjc7iGRwpr0tdnT4Q5agj5EUGHCrd3"]).log(level: .all, options: [.onlyDebug, .jsonPrettyPrint, .includeSeparator])
            .responseJSON { (response) in
                
                // do some thing
                
                NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
                
                if let statusCode = response.response?.statusCode {
                    print("STATUS CODE \(statusCode)")
                }
                
                switch response.result {
                case .failure(let error) :
                    print(error)
                case .success(let responseObject) :
                    if let apiResponse = Mapper<APIResponse<User>>().map(JSONObject: responseObject) {
                        print(apiResponse.data?.description)
                        
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

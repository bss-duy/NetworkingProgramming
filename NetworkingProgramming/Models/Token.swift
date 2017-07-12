//
//  Token.swift
//  NetworkingProgramming
//
//  Created by Duy Nguyen on 6/22/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit
import ObjectMapper

class Token: NSObject, Mappable {
    
    public var tokenType : String?
    public var accessToken : String?
    public var expiresIn : Int?
    public var user: User?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        tokenType <- map["token_type"]
        accessToken <- map["access_token"]
        expiresIn <- map["expires_in"]
    }
    
    override var description : String {
        return "token = \(accessToken) expiresIn = \(expiresIn)"
    }
}

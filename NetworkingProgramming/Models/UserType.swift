//
//  UserType.swift
//  caf_ios
//
//  Created by Duy Nguyen on 3/17/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import ObjectMapper

public protocol UserType : Mappable {
    var id : String? { get }
    var username : String? { get }
    var accessToken : String? { get }
    var email : String? { get }
}


class User : NSObject, UserType {
    var id: String?
    var username : String?
    var accessToken : String?
    var email : String?
    var lat: Double?
    var long: Double?
    var address: Address?
    var isNotificationNewMessage : Bool?
    
    override init() {
        super.init()
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        username <- map["name"]
        isNotificationNewMessage <- map["isNotificationNewMessage"]
        //accessToken <- map["accessToken"]
        email <- map["email"]
    }
    
    override var description : String {
        return "id = \(id) username = \(username)"
    }
}

class Address : NSObject, Mappable {
    var lat: String?
    var long : String?
    
    override init() {
        super.init()
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        lat <- map["lat"]
        long <- map["long"]
    }
    
}


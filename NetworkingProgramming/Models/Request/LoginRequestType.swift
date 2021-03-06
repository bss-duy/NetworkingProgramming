//
//  LoginRequestType.swift
//  caf_ios
//
//  Created by Duy Nguyen on 3/20/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import ObjectMapper

public protocol LoginRequestType : Mappable {
    var emailOrUsername: String? {get}
    var password: String? {get}
}

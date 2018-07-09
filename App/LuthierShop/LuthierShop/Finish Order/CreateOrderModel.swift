//
//  CreateOrderModel.swift
//  LuthierShop
//
//  Created by Yeltsin Suares Lobato Gama on 21/06/18.
//  Copyright © 2018 Yeltsin Suares Lobato Gama. All rights reserved.
//

import Foundation

struct CreateOrderModel {
    
    struct Request {
        var name         : String?
    }
    
    struct Response {
        var error: Error?
    }
    
    struct RegisterCollaboratorViewModel {
        var error: Error?
    }
}

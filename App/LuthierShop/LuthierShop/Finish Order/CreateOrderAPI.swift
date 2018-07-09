//
//  CreateOrderAPI.swift
//  LuthierShop
//
//  Created by Yeltsin Suares Lobato Gama on 21/06/18.
//  Copyright © 2018 Yeltsin Suares Lobato Gama. All rights reserved.
//

import Foundation
import Alamofire

class RequestApi: NSObject {
    
    // MARK: - Create Order
    
    static func getDataByTriple(subject: String = "s", predicate: String = "p", object: String = "o", completionHandler: @escaping (DataResponse<Any>) -> Void) {
         
        let header  = ["Content-Type": "application/sparql-results+json"]
        
        let url = ApiConstants.getUrlFormatByTriple(subject: subject, predicate: predicate, object: object)
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            completionHandler(response)
        }
    }
    
    static func create(orderId: String, predicate: String, object: String, completionHandler: @escaping (DataResponse<Any>) -> Void) {
        
        Alamofire.request("http://virtuoso.economiaxp.com/sparql?&query=INSERT+DATA+%7BGRAPH+%3Cpedido_violoes%3E+%7B%3C\(orderId)%3E+%3C\(predicate)%3E+%3C\(object)%3E+%7D%7D%0D%0A&format=application%2Fsparql-results%2Bjson", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            completionHandler(response)
        }
    }
    
    static func getAllOrders(completionHandler: @escaping (DataResponse<Any>) -> Void) {
        
        Alamofire.request("http://virtuoso.economiaxp.com/sparql?default-graph-uri=&query=select+distinct+%3Fs+from+%3Cpedido_violoes%3E+where+%7B%3Fs+%3Fp+%3Fo%7D&should-sponge=&format=application%2Fsparql-results%2Bjson&timeout=0&signal_void=on&signal_unconnected=on&run=+Run+Query+", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            completionHandler(response)
        }
    }
}

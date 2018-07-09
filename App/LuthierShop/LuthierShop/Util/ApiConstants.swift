//
//  ApiConstants.swift
//  LuthierShop
//
//  Created by Yeltsin Suares Lobato Gama on 21/06/18.
//  Copyright © 2018 Yeltsin Suares Lobato Gama. All rights reserved.
//

import Foundation

struct ApiConstants {
    
    static let IP_ADDRESS = "instrument-ontology-api.herokuapp.com"

    struct Url {
        static let createOrder = "http://\(IP_ADDRESS)/createguitar"
        static let getOrders   = "http://\(IP_ADDRESS)/guitars"
    }
    
    static func addUrlPrefix(string: String) -> String {
        return "virtuoso.economiaxp.com%2FDAV%2Fhome%2Fguitar%2F\(string)"
    }
    
    static func getUrlFormatByTriple(subject: String = "s", predicate: String = "p", object: String = "?o") -> String {

        return "http://virtuoso.economiaxp.com/sparql?default-graph-uri=&query=SELECT+*+from+%3Cconsulta_violoes%3E+WHERE+%7B%3Chttp%3A%2F%2F\(subject)%3E+%3Chttp%3A%2F%2F\(predicate)%3E+%3F\(object)%7D&should-sponge=&format=application%2Fsparql-results%2Bjson&timeout=0&signal_void=on&signal_unconnected=on&run=+Run+Query+"
    }
}

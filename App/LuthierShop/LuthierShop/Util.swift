//
//  Util.swift
//  LuthierShop
//
//  Created by Yeltsin Suares Lobato Gama on 15/06/18.
//  Copyright © 2018 Yeltsin Suares Lobato Gama. All rights reserved.
//

import UIKit

class Step {
    var controllerTitle: String?
    var searchPredicate: String?
    var prefixUrl      : String?
    var value          : String?
    
    init(controllerTitle: String, searchPredicate: String, prefixUrl: String, value: String) {
        self.controllerTitle = controllerTitle
        self.searchPredicate = searchPredicate
        self.prefixUrl = prefixUrl
        self.value = value
    }
}

extension Collection {
    
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension UIViewController {
    
    func presentAlert(title: String?, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        
        let alertError = UIAlertController(title: title ?? "Erro", message: message, preferredStyle: .alert)
        alertError.addAction(UIAlertAction(title: "ok", style: .default, handler: handler))
        self.present(alertError, animated: true, completion: nil)
    }
}

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}

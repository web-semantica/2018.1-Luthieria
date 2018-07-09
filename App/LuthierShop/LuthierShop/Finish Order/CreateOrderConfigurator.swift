//
//  CreateOrderConfigurator.swift
//  LuthierShop
//
//  Created by Yeltsin Suares Lobato Gama on 21/06/18.
//  Copyright © 2018 Yeltsin Suares Lobato Gama. All rights reserved.
//

import UIKit

protocol CreateOrderViewOutput {
    func createPoll()
}

protocol CreateOrderInteractorOutput {
    func presentCreateOrderResults()
}

protocol  CreateOrderPresenterOutput: class {
    func successCreatedOrder()
    func errorCreatedOrder()
}

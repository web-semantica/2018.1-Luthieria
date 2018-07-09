//
//  CreateOrderViewController.swift
//  LuthierShop
//
//  Created by Yeltsin Suares Lobato Gama on 21/06/18.
//  Copyright © 2018 Yeltsin Suares Lobato Gama. All rights reserved.
//

import UIKit

class CreateOrderViewController: UIViewController {
    
    @IBOutlet weak var labelTipoViolao: UILabel!
    @IBOutlet weak var labelMadeiraTampo: UILabel!
    @IBOutlet weak var labelMaterialDoCavalete: UILabel!
    @IBOutlet weak var labelMaterialDaRoseta: UILabel!
    @IBOutlet weak var labelMaterialDoRastilho: UILabel!
    @IBOutlet weak var labelMaterialDoBraço: UILabel!
    @IBOutlet weak var labelMaterialDoFilete: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        labelTipoViolao.text = Instrument.sharedInstance.steps[0].controllerTitle! + ": " + (Instrument.sharedInstance.steps[0].value ?? "")
        labelMadeiraTampo.text = Instrument.sharedInstance.steps[1].controllerTitle! + ": " + (Instrument.sharedInstance.steps[1].value ?? "")
        labelMaterialDoCavalete.text = Instrument.sharedInstance.steps[2].controllerTitle! + ": " + (Instrument.sharedInstance.steps[2].value ?? "")
        labelMaterialDaRoseta.text = Instrument.sharedInstance.steps[3].controllerTitle! + ": " + (Instrument.sharedInstance.steps[3].value ?? "")
        labelMaterialDoRastilho.text = Instrument.sharedInstance.steps[4].controllerTitle! + ": " + (Instrument.sharedInstance.steps[4].value ?? "")
        labelMaterialDoBraço.text = Instrument.sharedInstance.steps[5].controllerTitle! + ": " + (Instrument.sharedInstance.steps[5].value ?? "")
        labelMaterialDoFilete.text = Instrument.sharedInstance.steps[6].controllerTitle! + ": " + (Instrument.sharedInstance.steps[6].value ?? "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func createOrder(_ sender: Any) {
        
        var value = 0
        
        RequestApi.getAllOrders { (response) in
            print(response)
            
            if let dict = response.value as? [String:Any] {
                
                if let results = dict["results"] as? [String:Any] {
                    print(results)
                    if let bindings = results["bindings"] as? [[String:Any]] {
                        
                        
                        for binding in bindings {
                            if let _ = binding["s"] as? [String:Any] {
                                value += 1
                            }
                        }
                    }
                }
            }

            for obj in Instrument.sharedInstance.steps {
                RequestApi.create(orderId: "pedido" + String(value + 1), predicate: obj.searchPredicate!, object: obj.value!.replacingOccurrences(of: " ", with: "_")) { (response) in
                    print("\nValue: ", obj.searchPredicate!)
                    print("\nValue: ", obj.value!)
                    print("RESPONSE: ", response)
                    self.presentAlert(title: "", message: "Pedido criado com sucesso", handler: { (_) in
                        
                        
                        let scheduleStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let controller = scheduleStoryboard.instantiateInitialViewController()
                        self.present(controller!, animated: false, completion: nil)
                    })
                }
            }
        }
    }
}

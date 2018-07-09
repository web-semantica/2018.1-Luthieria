//
//  OrderResumeViewController.swift
//  LuthierShop
//
//  Created by Yeltsin Suares Lobato Gama on 21/06/18.
//  Copyright © 2018 Yeltsin Suares Lobato Gama. All rights reserved.
//

import UIKit

class OrderResumeViewController: UIViewController {
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dissmissScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
}

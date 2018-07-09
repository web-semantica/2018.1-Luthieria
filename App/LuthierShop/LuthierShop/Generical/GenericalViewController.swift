//
//  GenericalViewController.swift
//  LuthierShop
//
//  Created by Yeltsin Suares Lobato Gama on 21/06/18.
//  Copyright © 2018 Yeltsin Suares Lobato Gama. All rights reserved.
//

import UIKit

class GenericalViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var woodTypes = [String]()
    var advancing = true
    var currentStep = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = Instrument.sharedInstance.currentStep.controllerTitle
        guard woodTypes.count == 0 else { return }
        currentStep = Instrument.sharedInstance.currentStepIndex
        RequestApi.getDataByTriple(subject: ApiConstants.addUrlPrefix(string: "Violao" + Instrument.sharedInstance.type!), predicate: ApiConstants.addUrlPrefix(string: Instrument.sharedInstance.currentStep.searchPredicate!)) { (response) in
            
            if let dict = response.value as? [String:Any] {
                
                if let results = dict["results"] as? [String:Any] {
                    
                    if let bindings = results["bindings"] as? [[String:Any]] {
                        
                        
                        for binding in bindings {
                            if let ojectNotParsed = binding["o"] as? [String:Any] {
                                
                                guard let objectString = ojectNotParsed["value"] as? String else { return }
                                self.woodTypes.append(objectString.deletingPrefix("http://virtuoso.economiaxp.com/DAV/home/guitar/\(Instrument.sharedInstance.currentStep.prefixUrl!)").replacingOccurrences(of: "_", with: " "))
                            }
                        }
                    }
                }
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if currentStep == Instrument.sharedInstance.currentStepIndex {
            Instrument.sharedInstance.backStep()
        }
    }
    
    @IBAction func orderResume(_ sender: Any) {
        performSegue(withIdentifier: "callOrderResume", sender: self)
    }
}

extension GenericalViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Instrument.sharedInstance.currentStep.value = woodTypes[indexPath.row]
        if let _ = Instrument.sharedInstance.steps[safe: Instrument.sharedInstance.currentStepIndex + 1] {
            Instrument.sharedInstance.advanceStep()
            performSegue(withIdentifier: "callNextStep", sender: self)
        } else {
            performSegue(withIdentifier: "callCreateOrder", sender: self)
        }
    }
}

extension GenericalViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return woodTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "genericalTableViewCell") as! GenericalTableViewCell
        
        
        if let woodTypeName = woodTypes[safe: indexPath.row] {
            cell.labelWoodType.text = woodTypeName
        }
        
        return cell
    }
}

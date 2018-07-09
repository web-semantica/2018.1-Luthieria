//
//  SelectGuitarTypesViewController.swift
//  LuthierShop
//
//  Created by Yeltsin Suares Lobato Gama on 15/06/18.
//  Copyright © 2018 Yeltsin Suares Lobato Gama. All rights reserved.
//

import UIKit

class SelectGuitarTypesViewController: UIViewController {
    
    var guitarTypes = [String]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        
        RequestApi.getDataByTriple(subject: ApiConstants.addUrlPrefix(string: "Violao"), predicate: ApiConstants.addUrlPrefix(string: "tem_tipo")) { (response) in
            
            if let dict = response.value as? [String:Any] {
                
                if let results = dict["results"] as? [String:Any] {
                    print(results)
                    if let bindings = results["bindings"] as? [[String:Any]] {
                        
                        
                        for binding in bindings {
                            if let ojectNotParsed = binding["o"] as? [String:Any] {
                                
                                guard let objectString = ojectNotParsed["value"] as? String else { return }
                                self.guitarTypes.append(objectString.deletingPrefix("http://virtuoso.economiaxp.com/DAV/home/guitar/"))
                            }
                        }
                    }
                }
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Escolha o modelo do violão"
    }
}

extension SelectGuitarTypesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let guitarTypeName = guitarTypes[safe: indexPath.row] {
            Instrument.sharedInstance.type = guitarTypeName
            Instrument.sharedInstance.steps[0].value = guitarTypeName
            Instrument.sharedInstance.advanceStep()
            performSegue(withIdentifier: "callGenerical", sender: self)
        }
    }
}

extension SelectGuitarTypesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guitarTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectGuitarTypeCell") as! SelectGuitarTypeCell

        
        if let guitarTypeName = guitarTypes[safe: indexPath.row] {
            cell.labelGuitarType.text = guitarTypeName
            cell.guitarBodyTypeImage.image = UIImage(named: guitarTypeName)
        }
        
        return cell
    }
}

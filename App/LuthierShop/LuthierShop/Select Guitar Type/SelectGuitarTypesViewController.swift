//
//  SelectGuitarTypesViewController.swift
//  LuthierShop
//
//  Created by Yeltsin Suares Lobato Gama on 15/06/18.
//  Copyright © 2018 Yeltsin Suares Lobato Gama. All rights reserved.
//

import UIKit

class SelectGuitarTypesViewController: UIViewController {
    
    let guitarTypes = ["Classico", "Folk", "Jumbo"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Escolha o modelo do violão"
    }
}

extension SelectGuitarTypesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let guitarTypeName = guitarTypes[safe: indexPath.row] {
            guard let instrumentType = GuitarBodyType(rawValue: guitarTypeName) else { return }
            Instrument.sharedInstance.model = instrumentType
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

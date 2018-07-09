//
//  User.swift
//  LuthierShop
//
//  Created by Yeltsin Suares Lobato Gama on 18/06/18.
//  Copyright © 2018 Yeltsin Suares Lobato Gama. All rights reserved.
//

import UIKit

class Instrument {
    
    var model     : GuitarBodyType?
    var type      : String?
    var bodyWood  : String?
    var coverWood : String?
    var armWood   : String?
    
    var currentStepIndex = 0
    
    var steps = [Step(controllerTitle: "Tipo do violão",              searchPredicate: "tem_violao",             prefixUrl: "",          value: ""),
                 Step(controllerTitle: "Material do Tampo",           searchPredicate: "tem_tampo",              prefixUrl: "madeira_",  value: ""),
                 Step(controllerTitle: "Material do Cavalete",        searchPredicate: "possui_cavalete",        prefixUrl: "material_", value: ""),
                 Step(controllerTitle: "Material da Roseta",          searchPredicate: "possui_roseta",          prefixUrl: "material_", value: ""),
                 Step(controllerTitle: "Material do Rastilho",        searchPredicate: "possui_rastilho",        prefixUrl: "material_", value: ""),
                 Step(controllerTitle: "Material do Braço",           searchPredicate: "possui_braco",           prefixUrl: "madeira_",  value: ""),
                 Step(controllerTitle: "Material do Filete",          searchPredicate: "possui_filete",          prefixUrl: "madeira_",  value: ""),
                 Step(controllerTitle: "Material do Fundo",           searchPredicate: "possui_fundo",           prefixUrl: "madeira_",  value: ""),
                 Step(controllerTitle: "Material do Lateral",         searchPredicate: "possui_lateral",         prefixUrl: "madeira_",  value: ""),
                 Step(controllerTitle: "Material do Leque Harmonico", searchPredicate: "possui_leque_harmonico", prefixUrl: "madeira_",  value: ""),
                 Step(controllerTitle: "Material do Mão",             searchPredicate: "possui_mao",             prefixUrl: "madeira_",  value: ""),
                 Step(controllerTitle: "Material do Pestana",         searchPredicate: "possui_pestana",         prefixUrl: "material_",  value: ""),
                 Step(controllerTitle: "Material do Salto",           searchPredicate: "possui_salto",           prefixUrl: "madeira_",  value: ""),
                 Step(controllerTitle: "Tipo do Fundo",               searchPredicate: "possuifundo_tipo",       prefixUrl: "",  value: ""),
                 Step(controllerTitle: "Tipo da Tarraxa",             searchPredicate: "tem_tarraxa",            prefixUrl: "",  value: ""),
                 Step(controllerTitle: "Tipo da Corda",               searchPredicate: "possui_corda",           prefixUrl: "",  value: ""),
                 Step(controllerTitle: "Material da Escala",          searchPredicate: "possui_escala",          prefixUrl: "material_",  value: "")]
    
    var currentStep: Step = Step(controllerTitle: "Material do Tampo", searchPredicate: "tem_tampo", prefixUrl: "", value: "")

    func advanceStep() {
        self.currentStepIndex = self.currentStepIndex + 1
        self.currentStep = self.steps[currentStepIndex]
    }
    
    func backStep() {
        self.currentStepIndex -= 1
        self.currentStep = self.steps[currentStepIndex]

    }
    
    static let sharedInstance = Instrument()
}

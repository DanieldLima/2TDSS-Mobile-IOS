//
//  SecundViewController.swift
//  Revisao NAC2 Project2
//
//  Created by user140257 on 04/05/2018.
//  Copyright © 2018 FIAP. All rights reserved.
//

import UIKit

class SecundViewController: UIViewController {
    
    @IBOutlet weak var tfValue1: UITextField!
    @IBOutlet weak var tfValue2: UITextField!
    
    @IBOutlet weak var lbResult: UILabel!
    
    var result: Double = 0
    

    @IBOutlet weak var lbValueScore: UILabel!
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Resultado da NAC2"
        lbValueScore.text = "Esta es a correção da NAC2 de iOS que vou tirar \(score)!"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        
        if let value1 = Double(tfValue1.text!), let value2 = Double(tfValue2.text!) {
            result = value1 + value2
        }
        
        lbResult.text = "\(Int(result))"
        view.endEditing(true)
        
    }
    
    /*
 
     @IBAction func calculate(_ sender: Any) {
     if let weight = Double(tfWeight.text!), let height = Double(tfHeight.text!) {
     imc = weight / (height * height)
     
     showResults()
     }
     }
     
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     view.endEditing(true)
     }
     
     func showResults() {
     var result: String = ""
     var image: String = ""
     
     switch imc {
     case 0..<16:
     result = "Magreza"
     image = "abaixo"
     
     case 16..<18.5:
     result = "Abaixo do peso"
     image = "abaixo"
     
     case 18.5..<25:
     result = "Peso ideal"
     image = "ideal"
     
     case 25..<30:
     result = "Sobrepeso"
     image = "sobre"
     
     default:
     result = "Obesidade"
     image = "obesidade"
     }
     
     lbResult.text = "\(Int(imc)): \(result)"
     ivResult.image = UIImage(named: image)
     viResult.isHidden = false
     view.endEditing(true)
     }
 
     */
    
}

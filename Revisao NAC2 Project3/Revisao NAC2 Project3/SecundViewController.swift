//
//  SecundViewController.swift
//  Revisao NAC2 Project3
//
//  Created by user140257 on 04/05/2018.
//  Copyright © 2018 FIAP. All rights reserved.
//

import UIKit

class SecundViewController: UIViewController {
    
    @IBOutlet weak var tfValue1: UITextField!
    @IBOutlet weak var tfValue2: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    
    @IBOutlet weak var viResult: UIView!
    var result: Double = 0
    
    @IBOutlet weak var lbValueScore: UILabel!
    
    var score: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Resultado"
        lbValueScore.text = "Nota da NAC2: \(score)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculate(_ sender: UIButton) {
        
        if let value1 = Double(tfValue2.text!), let value2 = Double(tfValue2.text!) {
            
            result = value1  + value2
            lbResult.text = "\(Int(result))"
            view.backgroundColor = .orange
            viResult.isHidden = false
            view.endEditing(true)
        }
        
    }
    

}

//
//  SecondViewController.swift
//  RevisaoNAC2
//
//  Created by user140257 on 04/05/2018.
//  Copyright © 2018 FIAP. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var lbValueScore: UILabel!
    
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Resultado"
        lbValueScore.text = "Você tirou  a nota \(score) na NAC2 de iOS"
    }
    

    /*
     @IBOutlet weak var lbExameScore: UILabel!
     
     var score: Int = 0
     
     override func viewDidLoad() {
     super.viewDidLoad()
     
     title = "Resultado"
     lbExameScore.text = "Você tirou a nota \(score) na NAC 2!"
     }

    */

}

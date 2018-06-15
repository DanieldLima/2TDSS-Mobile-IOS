//
//  ViewController.swift
//  Console5
//
//  Created by user140257 on 15/06/2018.
//  Copyright © 2018 FIAP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ivConsole: UIImageView!
    @IBOutlet weak var lbFabricante: UILabel!
    @IBOutlet weak var lbDataLancamento: UILabel!
    @IBOutlet weak var lbUnidadeVendidas: UILabel!
    
    var console: Console!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = console.name
        ivConsole.image = UIImage(named: console.image)
        lbFabricante.text = "Fabricante: \(console.manufacturer)"
        lbDataLancamento.text = "Data de lançamento: \(console.releaseDate)"
        lbUnidadeVendidas.text = String(format: "Unidades vendidas: %.0f", console.unitsSold)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}


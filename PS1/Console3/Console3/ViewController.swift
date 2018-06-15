//
//  ViewController.swift
//  Console3
//
//  Created by user140257 on 11/06/2018.
//  Copyright © 2018 FIAP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ivConsole: UIImageView!
    @IBOutlet weak var lbFabricante: UILabel!
    @IBOutlet weak var lbDataLamento: UILabel!
    @IBOutlet weak var lbUnidadesVendidas: UILabel!
    
    var console:Console!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = console.name
        lbFabricante.text = "Fabricante: \(console.manufacturer)"
        lbDataLamento.text = "Data de lançamento: \(console.releaseDate)"
        lbUnidadesVendidas.text = "Unidades vendidas: \(String(format: "%.0f", console.unitsSold))"
        ivConsole.image = UIImage(named: console.image)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}


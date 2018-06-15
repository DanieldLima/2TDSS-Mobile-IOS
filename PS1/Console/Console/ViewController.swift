//
//  ViewController.swift
//  Console
//
//  Created by user140257 on 10/06/2018.
//  Copyright © 2018 FIAP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ivConsole: UIImageView!
    @IBOutlet weak var lbFabricante: UILabel!
    @IBOutlet weak var lbDataLancamento: UILabel!
    @IBOutlet weak var lbUnidadesVendidas: UILabel!
    
    var console: Console!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = console.name
        lbFabricante.text = "Fabricante \(console.manufacturer)"
        lbDataLancamento.text = "Data de lançamento: \(console.releaseDate)"
        lbUnidadesVendidas.text = "Unidades vendidades: \(String(format: "%.0f", console.unitsSold))"
        ivConsole.image = UIImage(named: console.image)
    }
    
    


}


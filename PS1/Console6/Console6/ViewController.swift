//
//  ViewController.swift
//  Console6
//
//  Created by user140257 on 15/06/2018.
//  Copyright © 2018 FIAP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ivConsoles: UIImageView!
    @IBOutlet weak var lbFabricante: UILabel!
    @IBOutlet weak var lbDataLancamento: UILabel!
    @IBOutlet weak var lbUnidadesVendidas: UILabel!
    
    var console: Console!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = console.name
        lbFabricante.text = "Fabricante: \(console.manufacturer)"
        lbDataLancamento.text = "Data de lançamento: \(console.releaseDate)"
        lbUnidadesVendidas.text = String(format: "Unidades vendidas: %.0f", console.unitsSold)
        ivConsoles.image = UIImage(named: console.image)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


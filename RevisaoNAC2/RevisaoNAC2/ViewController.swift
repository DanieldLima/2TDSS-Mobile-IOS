//
//  ViewController.swift
//  RevisaoNAC2
//
//  Created by user140257 on 04/05/2018.
//  Copyright © 2018 FIAP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? SecondViewController else { return }
        vc.score = 10
        
    }
    
    
    @IBAction func SecondViewController(_ sender: UIButton) {
        
        performSegue(withIdentifier: "segue", sender: sender)
        
    }
    
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? SecondViewController else { return }
        
        vc.score = 10
    }
    
    @IBAction func callSecondViewController(_ sender: UIButton) {
        performSegue(withIdentifier: "segue", sender: sender)
    }
    */

}


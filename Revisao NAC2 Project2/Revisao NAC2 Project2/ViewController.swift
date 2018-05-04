//
//  ViewController.swift
//  Revisao NAC2 Project2
//
//  Created by user140257 on 04/05/2018.
//  Copyright © 2018 FIAP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? SecundViewController else { return }
        vc.score = 10
    }
    
    @IBAction func nextViewControle(_ sender: UIButton) {
        
        performSegue(withIdentifier: "segue", sender: sender)
        
    }
    

}


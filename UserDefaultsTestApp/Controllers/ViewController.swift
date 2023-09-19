//
//  ViewController.swift
//  UserDefaultsTestApp
//
//  Created by Марк Фокша on 14.09.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //class
        UserClassManager.setData()
        UserStructManager.setData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //class
        UserClassManager.unarchiveData()
        
        //struct
        UserStructManager.unarchiveData()
    }

}


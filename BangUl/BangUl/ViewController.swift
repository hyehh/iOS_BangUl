//
//  ViewController.swift
//  BangUl
//
//  Created by Hyeji on 2021/09/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initSetting()
    }
    
    func initSetting() {
        btnSignIn.layer.cornerRadius = 15
        btnLogin.layer.cornerRadius = 15
        btnSignIn.layer.borderWidth = 1.5
        btnSignIn.layer.borderColor = UIColor(displayP3Red: 0/255, green: 103/255, blue: 163/255, alpha: 1).cgColor
        
        navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

    @IBAction func btnSignIn(_ sender: UIButton) {
        self.performSegue(withIdentifier: "sgSignIn", sender: self)
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        self.performSegue(withIdentifier: "sgLogin", sender: self)
    }
    
}


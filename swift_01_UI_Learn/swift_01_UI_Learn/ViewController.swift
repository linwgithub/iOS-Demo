//
//  ViewController.swift
//  swift_01_UI_Learn
//
//  Created by 林威 on 16/5/6.
//  Copyright © 2016年 林威. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var main_image: UIImageView!
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var passTextField: UITextField!
    
    
    
    @IBAction func loginButton(sender: AnyObject) {
        print(nameTextField.text)
        print(passTextField.text)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.reloadInputViews()
        passTextField.resignFirstResponder()
        nameTextField.resignFirstResponder()

    }

}


//
//  ViewController.swift
//  calculator_app
//
//  Created by 川井やまと on 2025/01/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var plusMinusButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var timesButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var Button5: UIButton!
    @IBOutlet weak var Button6: UIButton!
    @IBOutlet weak var Button7: UIButton!
    @IBOutlet weak var Button8: UIButton!
    @IBOutlet weak var Button9: UIButton!
    @IBOutlet weak var Button0: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    
    var buttonArr:[UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonArr =  [clearButton, plusMinusButton, percentButton, divideButton,timesButton,plusButton, minusButton,resultButton, Button1, Button2, Button3, Button4, Button5,Button6, Button7, Button8, Button9,Button0 ,dotButton ]
        for btn in buttonArr {
            btn.layer.cornerRadius = 20.0
        }
    }


}


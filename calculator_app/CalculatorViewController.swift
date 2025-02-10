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
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var subtractionButton: UIButton!
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
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var calculationLabel: UILabel!
    
    
    var buttonArr:[UIButton] = []
    var currentVal: Double = 0
    var isNewInput: Bool = true
    var currentOperator: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 全ボタン配列
        buttonArr =  [clearButton, plusMinusButton, percentButton, divisionButton,multiplicationButton,additionButton, subtractionButton,resultButton, Button1, Button2, Button3, Button4, Button5,Button6, Button7, Button8, Button9,Button0 ,dotButton ]
        // ボタン角丸く
        for btn in buttonArr {
            btn.layer.cornerRadius = 20.0
        }
    }
    
    /// 数字ボタンクリックイベント：各数字表示
    /// - Parameter sender:
    @IBAction func tapNumber(_ sender: Any) {
        guard let btn = sender as? UIButton, let btnText = btn.titleLabel?.text else { return }
        if isNewInput {
            inputLabel.text = btnText
            isNewInput = false
        } else {
            inputLabel.text = (inputLabel.text ?? "") + btnText
        }
        
        UIView.animate(withDuration: 0.1, animations: {
            btn.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                btn.transform = CGAffineTransform.identity
            }
        }
        
        btn.backgroundColor = .lightGray
        UIView.animate(withDuration: 0.5){
            btn.backgroundColor = .darkGray
        }
    }
    
    
    /// 計算・計算内容表示用関数
    /// - Parameter op: 演算子
    func calculateWithEachOperator(operator op: String) {
        if let inputText = inputLabel.text, let inputNumber = Double(inputText) {
            
            if currentOperator.isEmpty {
                // 最初の演算時は currentVal にセット
                currentVal = inputNumber
            } else {
                if inputNumber == 0 {
                    inputLabel.text = "Error"
                    return
                }
                // 計算結果を更新
                switch currentOperator {
                case "+":
                    currentVal += inputNumber
                case "-":
                    currentVal -= inputNumber
                case "*":
                    currentVal *= inputNumber
                case "/":
                    currentVal /= inputNumber
                default:
                    break
                }
            }
            
            // 計算ラベルに追加
            calculationLabel.text = (calculationLabel.text ?? "") + inputText + " " + op + " "
            // 小数の有無判断
            inputLabel.text = currentVal.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(currentVal)) : String(currentVal)
            currentOperator = op
            isNewInput = true
        }
    }
    
    ///＋ボタンクリックイベント：足し算
    /// - Parameter sender:
    @IBAction func additionButtonTapped(_ sender: Any) {
        calculateWithEachOperator(operator: "+")
    }
    
    /// ーボタンクリックイベント：引き算
    /// - Parameter sender:
    @IBAction func subtracitonButtonTapped(_ sender: Any) {
        calculateWithEachOperator(operator: "-")
    }
    
    /// × ボタンクリックイベント：掛け算
    /// - Parameter sender:
    @IBAction func multiplicationButtonTapped(_ sender: Any) {
        calculateWithEachOperator(operator: "*")
    }
    
    /// ÷ ボタンクリックイベント：割り算
    /// - Parameter sender:
    @IBAction func divisionButtonTapped(_ sender: Any) {
        calculateWithEachOperator(operator: "/")
    }
    
    /// Cボタンクリックイベント：値クリア
    /// - Parameter sender:
    @IBAction func clearButtonTapped(_ sender: Any) {
        inputLabel.text = ""
        calculationLabel.text = ""
        currentVal = 0
        isNewInput = true
    }
    
    /// ＝ボタンクリックイベント：計算結果表示
    /// - Parameter sender:
    @IBAction func resultButtonTapped(_ sender: Any) {
        calculateWithEachOperator(operator: "")
        calculationLabel.text = ""
        isNewInput = false
    }
    
    /// ％ボタンクリックイベント：入力値を%の値に変更
    /// - Parameter sender:
    @IBAction func percentButtonTapped(_ sender: Any) {
        if let inputText = inputLabel.text, let inputNumber = Double(inputText) {
            inputLabel.text = String(inputNumber/100)
        }
    }
    
    /// ＋／ーボタンクリックイベント：正負切替
    /// - Parameter sender:
    @IBAction func convertSignButtonTapped(_ sender: Any) {
        if let inputText = inputLabel.text, let inputNumber = Double(inputText) {
            if inputNumber > 0 {
                var negativeNum = "-" + inputText
                inputLabel.text = negativeNum
            } else if inputNumber < 0 {
                inputLabel.text = inputText.replacingOccurrences(of: "-", with: "")
            }
        }
    }
}


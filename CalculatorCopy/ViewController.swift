//
//  ViewController.swift
//  CalculatorCopy
//
//  Created by Sujit Molleti on 7/4/20.
//  Copyright © 2020 Sujit Molleti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Operators {
        case none, plus, minus, times, divides
    }
    
    enum States {
        case clear, digit1, float, op, equals, digit2
    }
    
    var numString: String?
    var firstNum: String?
    
    var op: Operators = Operators.none
    var state = States.clear
    
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numberTapped(_ sender: UIButton) {
        
        if state == .clear {
            state = .digit1
        }

        if numString == nil {
            numString = "\(sender.tag)"
        } else {
            numString = numString! + "\(sender.tag)"
        }
        
        if numString!.count > 11 {
            return
        }
        numberLabel.text = numString!
    }
    
    //cannot change name of the func once created
    @IBAction func addButtonTapped(_ sender: UIButton){
        
        isFirstNil()
        op = .plus
        state = .op
        
    }
    
    @IBAction func minusButtonTapped(_ sender: Any) {
        
        isFirstNil()
        op = .minus
        state = .op
        
    }
    
    @IBAction func timesButtonTapped(_ sender: Any) {
        
        isFirstNil()
        op = .times
        state = .op
    }
    
    @IBAction func dividesButtonTapped(_ sender: Any) {
        
        isFirstNil()
        op = .divides
        state = .op
    }
    
    func isFirstNil(){
        if(firstNum == nil){
            firstNum = numString
        }
        numString = nil
    }
    
    
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        
        guard let num1str = firstNum else { return }
        guard let num2str = numString else { return }
        
        guard let num1 = Double(num1str) else { return }
        guard let num2 = Double(num2str) else { return }
        
        //initializing total here, bc I do not want to unwrap it later
        var total: Double
        
        //checking which operator
        switch op{
        case .plus:
            total = num1 + num2
        case .minus:
            total = num1 - num2
        case .times:
            total = num1 * num2
        default:
            total = num1 / num2
        }
        
        firstNum = truncateTotal(total)
            
        numberLabel.text = firstNum
        numString = nil
        state = .equals
    }
    
    func truncateTotal(_ num: Double) -> String {
        
        if let s = Int(exactly: num) {
            return "\(s)"
        }
        
        return "\(num)"
        
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        
        numString = nil
        firstNum = nil
        numberLabel.text = "0"
        state = .clear
    }
    
    @IBAction func decimalButtonTapped(_ sender: UIButton) {
        
        if(state != .float){
            numString = numString! + "."
            updateNumLabel()
        }
        
        state = .float
    }
    @IBAction func negativeButtonTapped(_ sender: UIButton) {
        
    }
    @IBAction func percentButton(_ sender: UIButton) {
        
    }
    
    func updateNumLabel(){
        numberLabel.text = numString
    }
}


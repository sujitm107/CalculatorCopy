//
//  ViewController.swift
//  CalculatorCopy
//
//  Created by Sujit Molleti on 7/4/20.
//  Copyright © 2020 Sujit Molleti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numString: String?
    //var secondNum: String?
    var firstNum: String?
    
    var op: Operators = Operators.none
    var state = States.clear
    
    enum Operators {
        case none, plus, minus, times, divides
    }
    
    enum States {
        case clear, digit1, op, equals, digit2
    }

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
        
        firstNum = numString
        numString = nil
        
        op = .plus
        
    }
    
    @IBAction func minusButtonTapped(_ sender: Any) {
        
        firstNum = numString
        numString = nil
        
        op = .minus
        
    }
    
    @IBAction func timesButtonTapped(_ sender: Any) {
        
        firstNum = numString
        numString = nil
        
        op = .times
    }
    
    @IBAction func dividesButtonTapped(_ sender: Any) {
        
        firstNum = numString
        numString = nil
        
        op = .divides
    }
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        
        guard let num1str = firstNum else { return }
        guard let num2str = numString else { return }
        
        guard let num1 = Int(num1str) else { return }
        guard let num2 = Int(num2str) else { return }
        
        //initializing total here, bc I do not want to unwrap it later
        var total = 0
        
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
            
        numberLabel.text = "\(total)"
    }
    
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        
        numString = nil
        numberLabel.text = "0"
    }
    
}


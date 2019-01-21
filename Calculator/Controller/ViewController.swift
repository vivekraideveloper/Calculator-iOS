//
//  ViewController.swift
//  Calculator
//
//  Created by Vivek Rai on 21/01/19.
//  Copyright © 2019 Vivek Rai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabelText: UILabel!
    
    private var isFinishedTyping: Bool = true
    
    private var calculator = CalculatorLogic()
    
    
    
    private var displayValue: Double{
        get{
            guard let number = Double(displayLabelText.text!) else {
                fatalError()
            }
            return number
        }
        
        set{
            displayLabelText.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton){
        isFinishedTyping = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle{
            
            if let result = calculator.calculate(symbol: calcMethod){
                displayValue = result
            }
            
            
        }
        
        
    }

    @IBAction func numButtonPressed(_ sender: UIButton){
        if let numValue = sender.currentTitle{
            if isFinishedTyping{
                displayLabelText.text = numValue
                isFinishedTyping = false
            }else{
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt{
                        return
                    }
                    
                }
                
                displayLabelText.text = displayLabelText.text! + numValue
            }
            
        }
    }


}


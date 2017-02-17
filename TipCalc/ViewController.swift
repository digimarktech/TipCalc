//
//  ViewController.swift
//  TipCalc
//
//  Created by Marc Aupont on 12/8/16.
//  Copyright © 2016 Digimark Technical Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var subtotal: UITextField!
    @IBOutlet var tipPercentage: UITextField!
    @IBOutlet var partySize: UITextField!
    
    @IBOutlet var tipTotal: UILabel!
    @IBOutlet var total: UILabel!
    @IBOutlet var perPersonTotal: UILabel!
    
    @IBOutlet weak var tipStepper: UIStepper!
    @IBOutlet weak var partyStepper: UIStepper!
    
    var currencyFormatter = NumberFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        tipTotal.text = ""
        total.text = ""
        perPersonTotal.text = ""
        
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        
    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)
    }

    

    @IBAction func clearBtnPressed(_ sender: Any) {
        
        subtotal.text = ""
    }

    @IBAction func changeTipAmount(_ sender: Any) {
        
        tipPercentage.text = "\(tipStepper.value)"
    }
    
    @IBAction func changePartySize(_ sender: Any) {
        
        
    }
    
    @IBAction func calculateBtnPressed(_ sender: Any) {
        
        
        
        if subtotal.text != "" && tipPercentage.text != "" && partySize.text != "" {
            
            let subTotalAmount = Double(subtotal.text!)
            let tipPercentageAmount = Double(tipPercentage.text!)
            let partySizeAmount = Double(partySize.text!)
            
            let tipTotalAmount = (subTotalAmount! * (tipPercentageAmount! * 0.01))
            let finalTotalAmount = tipTotalAmount + subTotalAmount!
            let perPersonAmount = finalTotalAmount / partySizeAmount!
            
            //Format the values
            let tipTotalAmountString = currencyFormatter.string(from: NSNumber(value: tipTotalAmount))
            
            let finTotalAmountString = currencyFormatter.string(from: NSNumber(value: finalTotalAmount))
            
            let perPersonAmountString = currencyFormatter.string(from: NSNumber(value: perPersonAmount))
            
            tipTotal.text = tipTotalAmountString   //String(tipTotalAmount)
            total.text = finTotalAmountString //String(finalTotalAmount)
            perPersonTotal.text = perPersonAmountString //String(perPersonAmount)
            
            tipStepper.value = tipTotalAmount
            
            
        }
    }
    
    @IBAction func resetBtnPressed(_ sender: Any) {
        
        subtotal.text = ""
        tipPercentage.text = ""
        partySize.text = ""
        tipTotal.text = ""
        total.text = ""
        perPersonTotal.text = ""
        
    }
    
}


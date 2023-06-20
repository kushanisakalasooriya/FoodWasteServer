//
//  NutritionalCalculatorVC.swift
//  food_waste_reducing
//
//  Created by Kushani Sakalasooriya on 2023-04-19.
//

import UIKit

let grams = Double()
var calcTotalCalaries = Double()
var calcFats = Double()
var calcProtiens = Double()
var calcCarbohydrates = Double()
var dividedValue : Double = 100.0

class NutritionalCalculatorVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var noOfGrams: UITextField!
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var fats: UITextField!
    @IBOutlet weak var proteins: UITextField!
    @IBOutlet weak var carbohydrates: UITextField!
    @IBOutlet weak var totalCalaries: UITextField!
    
    let categoryArray = ["Green onions","Carrots","Potatoes","Tomatoes", "Pineapple"]
    let colorArray = [UIColor.black, UIColor.black, UIColor.black, UIColor.black, UIColor.black]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        noOfGrams.text = "200"
        categoryTitle.text = "Green onions"
    }
    
    // category picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        categoryArray.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryTitle.text = categoryArray[row]
        
        calculateCalaries()
    }
    
    
    // function for check validation and calling calculation functions
    func calculateCalaries() -> Any {
        
        let grams = Double(noOfGrams.text!)
        let category = categoryTitle.text
        
        if(grams == 0.0){
            // Display alert message
            let alert = UIAlertController(title: "Error", message: "Grams Cannot equals to zero", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return (
                fats.text = "",
                proteins.text = "",
                carbohydrates.text = "",
                totalCalaries.text = ""
            )
            
        }else if (grams! < 0.0) {
            // Display alert message
            let alert = UIAlertController(title: "Error", message: "Grams Cannot less than zero", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return (
                fats.text = "",
                proteins.text = "",
                carbohydrates.text = "",
                totalCalaries.text = ""
            )
            
        }else {
            
            // Call the calculation functions
            let val1 = calcFatsforFoods(inGrams: grams!, inCategory: category!)
            var val2 = calcProteinsforFoods(inGrams: grams!, inCategory: category!)
            var val3 = calcCarbohydratesforFoods(inGrams: grams!, inCategory: category!)
            var val4 = calcTotalCalariesforFoods(inGrams: grams!, inCategory: category!)

            fats.text = "\(val1)"
            proteins.text = "\(val2)"
            carbohydrates.text = "\(val3)"
            totalCalaries.text = "\(val4)"
            
        }
        
        return ""
    }
    
    // function for calculate Fats
    func calcFatsforFoods(inGrams : Double , inCategory : String) -> String {
        
        if (inCategory == "Green onions") {
            calcFats = (inGrams * 0.1) / 100
            return "\(calcFats)"
        }else if (inCategory == "Carrots") {
            calcFats = (inGrams * 0.2) / 100
            return "\(calcFats)"
        }else if (inCategory == "Potatoes") {
            calcFats = (inGrams * 0.1) / 100
            return "\(calcFats)"
        }else if (inCategory == "Tomatoes") {
            calcFats = (inGrams * 0.2) / 100
            return "\(calcFats)"
        }else {
            calcFats = (inGrams * 0.1) / 100
            return "\(calcFats)"
        }
        
    }
    
    // function for calculate Proteins
    func calcProteinsforFoods(inGrams : Double , inCategory : String) -> String {
        
        if (inCategory == "Green onions") {
            calcProtiens = (inGrams * 1.8) / 100
            return "\(calcProtiens)"
        }else if (inCategory == "Carrots") {
            calcProtiens = (inGrams * 0.9) / 100
            return "\(calcProtiens)"
        }else if (inCategory == "Potatoes") {
            calcProtiens = (inGrams * 0.2) / 100
            return "\(calcProtiens)"
        }else if (inCategory == "Tomatoes") {
            calcProtiens = (inGrams * 0.9) / 100
            return "\(calcProtiens)"
        }else {
            calcProtiens = (inGrams * 0.5) / 100
            return "\(calcProtiens)"
        }
        
    }
    
    // function for calculate Carbohydrates
    func calcCarbohydratesforFoods(inGrams : Double , inCategory : String) -> String {
        
        if (inCategory == "Green onions") {
            calcCarbohydrates = (inGrams * 7.3) / 100
            return "\(calcCarbohydrates)"
        }else if (inCategory == "Carrots") {
            calcCarbohydrates = (inGrams * 9.6) / 100
            return "\(calcCarbohydrates)"
        }else if (inCategory == "Potatoes") {
            calcCarbohydrates = (inGrams * 17.0) / 100
            return "\(calcCarbohydrates)"
        }else if (inCategory == "Tomatoes") {
            calcCarbohydrates = (inGrams * 3.9) / 100
            return "\(calcCarbohydrates)"
        }else {
            calcCarbohydrates = (inGrams * 13.1) / 100
            return "\(calcCarbohydrates)"
        }
        
    }
    
    // function for calculate total calories
    func calcTotalCalariesforFoods(inGrams : Double , inCategory : String) -> String {
        
        if (inCategory == "Green onions") {
            calcTotalCalaries = (inGrams * 32) / 100
            return "\(calcTotalCalaries)"
        }else if (inCategory == "Carrots") {
            calcTotalCalaries = (inGrams * 41) / 100
            return "\(calcTotalCalaries)"
        }else if (inCategory == "Potatoes") {
            calcTotalCalaries = (inGrams * 77) / 100
            return "\(calcTotalCalaries)"
        }else if (inCategory == "Tomatoes") {
            calcTotalCalaries = (inGrams * 18) / 100
            return "\(calcTotalCalaries)"
        }else {
            calcTotalCalaries = (inGrams * 50) / 100
            return "\(calcTotalCalaries)"
        }
        
    }
    
    
    // display pickers rows
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let attrb = NSAttributedString(string: categoryArray[row], attributes: [NSAttributedString.Key.foregroundColor : colorArray[row]])
        return attrb
    }
    
    
}

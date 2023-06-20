//
//  AddFoodWasteTipsVC.swift
//  food_waste_reducing
//
//  Created by Kushani Sakalasooriya on 2023-04-18.
//

import UIKit

class AddFoodWasteTipsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var txtFoodTitle: UITextField!
    @IBOutlet weak var txtFoodDescription: UITextView!
    @IBOutlet weak var txtFoodCategory: UILabel!
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    let categoryArray = ["Ways to Reduce Food Waste","Food Preservation Method","Replanting"]
    let colorArray = [UIColor.black, UIColor.black, UIColor.black]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        txtFoodCategory.text = "Ways to Reduce Food Waste"
    }
       
    
    // Food Category picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        categoryArray.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtFoodCategory.text = categoryArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let attrb = NSAttributedString(string: categoryArray[row], attributes: [NSAttributedString.Key.foregroundColor : colorArray[row]])
        return attrb
    }

    // Save button click
    @IBAction func onClickAdd(_ sender: Any) {
        
        if txtFoodTitle.text?.isEmpty ?? true  {
           // Display alert message
           let alert = UIAlertController(title: "Error", message: "Please Enter the Title", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           present(alert, animated: true, completion: nil)
           return
       } else if txtFoodDescription.text?.isEmpty ?? true {
           // Display alert message
           let alert = UIAlertController(title: "Error", message: "Please Enter the Description", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           present(alert, animated: true, completion: nil)
           return
      } else if txtFoodCategory.text?.isEmpty ?? true {
            // Display alert message
            let alert = UIAlertController(title: "Error", message: "Please Select the Category", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
      } else {
          if let foodTitle = txtFoodTitle.text, let foodDescription = txtFoodDescription.text, let foodCategory = txtFoodCategory.text {
              
              let newFood = Food(context: FoodDBManager.share.context)
              newFood.foodTitle = foodTitle
              newFood.foodDescription = foodDescription
              newFood.foodCategory = foodCategory
              FoodDBManager.share.saveContext()
              
              // Display a success message
              let alert = UIAlertController(title: "Success", message: "Saved successfully", preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                  // Navigate to the previous screen
                  self.navigationController?.popViewController(animated: true)
              }))
              present(alert, animated: true, completion: nil)
              
          }
      }
        
        
    }
    
}

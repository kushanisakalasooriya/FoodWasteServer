//
//  ReplantingVC.swift
//  food_waste_reducing
//
//  Created by Kushani Sakalasooriya on 2023-04-18.
//

import UIKit

class ReplantingVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    @IBOutlet weak var replaningTitle: UILabel!
    @IBOutlet weak var replaningDescription: UILabel!
    @IBOutlet weak var replaningPicker: UIPickerView!
    @IBOutlet weak var replaningNutritious: UILabel!
    
    let categoryArray = ["Green onions","Carrots","Potatoes","Tomatoes", "Pineapple"]
    let colorArray = [UIColor.black, UIColor.black, UIColor.black, UIColor.black, UIColor.black]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        replaningPicker.delegate = self
        replaningPicker.dataSource = self
    }
    
    // Plants Picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        categoryArray.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        replaningTitle.text = categoryArray[row]
        
        // check the plant name and  assigned values to text feilds
        if replaningTitle.text == "Green onions" {
           replaningDescription.text = "Save the white part of the green onion with the roots intact. Place the roots in a jar or glass of water and place in a sunny window. Change the water every few days, and soon new green onion shoots will grow. Cut the green onions at the base, leaving about 2 inches of the white part with the roots attached. Place the roots in a glass or jar filled with water, with the white part sticking out of the water. Put the jar in a sunny spot and change the water every few days to keep it fresh. The green onions should start growing within a few days, and you can use them in your cooking as they grow."
            
            replaningNutritious.text = "Green onions are a good source of vitamin K, which is important for blood clotting and bone health. They also contain vitamin C, which helps support the immune system, and small amounts of folate, which is important for cell growth and development."
            
       } else if replaningTitle.text == "Carrots" {
           
           replaningDescription.text = "Cut off the top of a carrot with about 1 inch of the stem intact. Place the carrot top in a shallow dish with water and place in a sunny spot. Change the water every few days, and soon the carrot will grow new green leaves. Cut off the carrot top, leaving about 1 inch of the stem. Place the carrot top in a shallow dish with water, with the cut end facing down and the stem sticking up. Place the dish in a sunny spot and change the water every few days. The carrot top should start growing new leaves within a week or two. Once the leaves have grown to about 4-5 inches, you can transfer the carrot top to a pot or garden bed with well-draining soil, burying the stem but leaving the leaves above the soil surface."
           
           replaningNutritious.text = "Carrots are high in beta-carotene, which the body converts to vitamin A. Vitamin A is important for healthy vision, skin, and immune function. Carrots also contain vitamin K, vitamin C, and potassium."
           
       } else if replaningTitle.text == "Potatoes" {
           
           replaningDescription.text = "Save a potato that has started to sprout. Cut the potato into sections, each with one or two sprouts. Let the cut sections dry for a few days, and then plant in soil with the sprouts facing up. Cut the potato into sections, each with at least one sprout. Let the cut sections dry for a few days in a warm, dry spot to prevent rot. Once the cut sections have dried, plant them in a pot or garden bed with well-draining soil, with the sprouts facing up and the cut side down. Cover the cut sections with about 2-3 inches of soil, and water the soil well. The potato plant should start growing within a few weeks."
           
           replaningNutritious.text = "Potatoes are a good source of vitamin C, which helps support the immune system and aids in the absorption of iron. They also contain vitamin B6, which helps the body make red blood cells, and potassium, which is important for maintaining healthy blood pressure."
           
       } else if replaningTitle.text == "Tomatoes" {
           
           replaningDescription.text = "Save tomato seeds from ripe tomatoes. Rinse the seeds and let them dry completely. Plant the seeds in soil in a sunny spot and keep the soil moist. Soon, tomato seedlings will grow. Rinse the tomato seeds and let them dry completely on a paper towel. Once the seeds are dry, plant them in a pot or garden bed with well-draining soil, covering the seeds with about 1/4 inch of soil. Keep the soil moist but not waterlogged, and place the pot or garden bed in a sunny spot. The tomato seeds should start germinating within a week or two, and you can transplant them to a bigger pot or garden bed once they have grown a few leaves."
           
           replaningNutritious.text = "Tomatoes are high in lycopene, an antioxidant that gives them their bright red color. Lycopene is thought to help protect against certain types of cancer, as well as support heart health. Tomatoes also contain vitamin C, vitamin K, and potassium."
           
       } else {
           
           replaningDescription.text = "Cut off the top of a pineapple and remove the outer layer of leaves. Let the pineapple top dry for a few days, and then plant it in soil. It will take a few years for the pineapple plant to produce fruit, but it makes a beautiful and unique houseplant in the meantime. Cut off the top of the pineapple, leaving about 1-2 inches of flesh attached to the green leaves. Let the pineapple top dry for a few days in a warm, dry spot. Once the pineapple top is dry, plant it in a pot with well-draining soil, burying the bottom inch of the leaves in the soil. Water the soil well, and place the pot in a sunny spot. The pineapple top should start growing within a few weeks. It will take a few years for the pineapple plant to grow big enough to produce fruit, so be patient!"
           
           replaningNutritious.text = "Pineapple is a good source of vitamin C, which helps support the immune system and aids in the absorption of iron. Pineapple also contains bromelain, an enzyme that can help improve digestion and reduce inflammation in the body. Additionally, pineapple is a good source of manganese, which is important for bone health and wound healing."
       }
        
        
    }
    
    // retrive the foods names as a row in picker
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let attrb = NSAttributedString(string: categoryArray[row], attributes: [NSAttributedString.Key.foregroundColor : colorArray[row]])
        return attrb
    }
    
    
}

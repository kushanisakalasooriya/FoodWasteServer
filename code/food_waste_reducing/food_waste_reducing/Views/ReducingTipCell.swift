//
//  ReducingTipCell.swift
//  food_waste_reducing
//
//  Created by Kushani Sakalasooriya on 2023-04-20.
//

import UIKit

class ReducingTipCell: UITableViewCell {

    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureTipsCell(food : Food) {
        titleLabel.text = food.foodTitle
        descriptionLabel.text = food.foodDescription
        categoryLabel.text = food.foodCategory
    }

}

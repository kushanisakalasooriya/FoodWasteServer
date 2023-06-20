//
//  ViewController.swift
//  food_waste_reducing
//
//  Created by Kushani Sakalasooriya on 2023-04-18.
//

import UIKit

class ViewController: UIViewController {
    
    var foods = [Food]()
    @IBOutlet weak var foodTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        foods = FoodDBManager.share.fetchFood()
        foodTableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // return the no of tips
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    // returning the tips as a cell in table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let aFood = foods[indexPath.row]
        cell.textLabel?.text = aFood.foodTitle
        cell.detailTextLabel?.text = aFood.foodDescription
        
        return cell
    }
    
    // deleteing the food waste reducing tips
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            do {
                try FoodDBManager.share.context.delete(foods[indexPath.row])
                
            }catch {
                print("Error in deleting")
            }
            FoodDBManager.share.saveContext()
            foods.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            // Display success alert message
            let alert = UIAlertController(title: "Success", message: "Deleted successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
    }
    
}


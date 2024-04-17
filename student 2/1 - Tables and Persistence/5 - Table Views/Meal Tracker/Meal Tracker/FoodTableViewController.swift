//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by student on 04/04/24.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var meals: [Meal] = {
        let breakfast = Meal(name: "Breakfast", food: [
            Food(name: "Eggs", description: "Scrambled eggs with cheese"),
            Food(name: "Toast", description: "Whole wheat toast with butter"),
            Food(name: "Orange Juice", description: "Freshly squeezed orange juice")
        ])

        let lunch = Meal(name: "Lunch", food: [
            Food(name: "Salad", description: "Mixed greens with tomatoes and cucumbers"),
            Food(name: "Sandwich", description: "Turkey and cheese sandwich on whole grain bread"),
            Food(name: "Apple", description: "Crisp apple")
        ])

        let dinner = Meal(name: "Dinner", food: [
            Food(name: "Grilled Chicken", description: "Juicy grilled chicken breast"),
            Food(name: "Rice", description: "Steamed brown rice"),
            Food(name: "Broccoli", description: "Steamed broccoli florets")
        ])

        return [breakfast, lunch, dinner]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        meals[section].food.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]
    
        var content = cell.defaultContentConfiguration()
        content.text = "\(food.name)"
        content.secondaryText = food.description
        cell.contentConfiguration = content
        cell.showsReorderControl = true

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
}

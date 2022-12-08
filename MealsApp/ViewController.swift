//
//  ViewController.swift
//  MealsApp
//
//  Created by Amel Sbaihi on 12/5/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var mealsArray = [Meal]()
    
    let urlString = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Meal Prep Ideas"
        
        
        
        DispatchQueue.global(qos: .userInitiated).async {
            if let url = URL(string: self.urlString)
            {
                if let data = try? Data(contentsOf: url) {
                    
                    // we are ok to parse
                    
                    self.parseJSON(json: data)
                    
                    return
                }
                
            }
            self.showError()
        }
        
    }
    
    func showError() {
        
        DispatchQueue.main.async {
            
            let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
    }
    
    
    
    
    
    
    
    func parseJSON (json: Data )  {
        
        let decoder = JSONDecoder()
        
        if let JSonmeals = try? decoder.decode(Meals.self, from: json) {
            
            mealsArray =  JSonmeals.meals
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
           }
        }
        
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = mealsArray[indexPath.row].strMeal
        cell.detailTextLabel?.text = mealsArray[indexPath.row].idMeal
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as? DetailViewController  {
            vc.mealDetails = mealsArray[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        
    }
    
}

//
//  DetailViewController.swift
//  MealsApp
//
//  Created by Amel Sbaihi on 12/5/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var   mealsDteailArray = [MealDetail]()
    
    var str1 : String?
    
    var mealDetails : Meal!
    
    @IBOutlet var mealLable: UILabel!
    
    @IBOutlet var mealImage: UIImageView!
    
    
    @IBOutlet var ingredientsTextView: UITextView!
    
    
    @IBOutlet var discriptionTextView: UITextView!
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        let urlDetailString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealDetails.idMeal)"
        print(urlDetailString)
        
        DispatchQueue.global(qos: .userInitiated).async {
            if let url = URL(string: urlDetailString)
            {
                if let data = try? Data(contentsOf: url) {
                    
                    // we are ok to parse
                    
                    self.parseJSONDetail(json: data)
                    return
                }
                
            }
            
            self.showError()
        }
        
        
    }
 
    func parseJSONDetail (json : Data) {
        
        let decoder = JSONDecoder()
        
        if let jsonDetailMeal = try? decoder.decode(Result.self, from: json) {
            
            DispatchQueue.main.async {
                
                self.mealsDteailArray = jsonDetailMeal.meals
                self.updateUIEelements()
                
                 }
           }
        
        
    }
    
    
    func showError() {
        
        DispatchQueue.main.async {
            
            let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
    }
    
    
    
    
    func updateUIEelements ()
    {
        
        mealLable.text = mealDetails.strMeal
        discriptionTextView.text = mealsDteailArray[0].strInstructions
        IngredientListCreating()
        
        
        
        if  let url = URL(string: mealsDteailArray[0].strMealThumb)
        {
            DispatchQueue.global(qos: .userInitiated).async {
                
                if let data = try? Data(contentsOf: url) {
                    
                    DispatchQueue.main.async {
                        
                        self.mealImage.image = UIImage(data: data)
                    }
                }
            }
        }
        
        
    }
    
    
    
    func setupIngredients (measure : String? , Ingredient : String?)
    {
        
        guard measure != nil else {return }
        ingredientsTextView.text += measure!
        guard Ingredient != nil else {return }
        ingredientsTextView.text += "  \(Ingredient!) \n "
    }
   
   
    
    
    func IngredientListCreating ()
    {
        ingredientsTextView.text = ""
        setupIngredients(measure: mealsDteailArray[0].strMeasure1 , Ingredient: mealsDteailArray[0].strIngredient1)
        setupIngredients(measure: mealsDteailArray[0].strMeasure2 , Ingredient: mealsDteailArray[0].strIngredient2)
        setupIngredients(measure: mealsDteailArray[0].strMeasure3 , Ingredient: mealsDteailArray[0].strIngredient3)
        setupIngredients(measure: mealsDteailArray[0].strMeasure4 , Ingredient: mealsDteailArray[0].strIngredient4)
        setupIngredients(measure: mealsDteailArray[0].strMeasure5 , Ingredient: mealsDteailArray[0].strIngredient5)
        setupIngredients(measure: mealsDteailArray[0].strMeasure6 , Ingredient: mealsDteailArray[0].strIngredient6)
        setupIngredients(measure: mealsDteailArray[0].strMeasure7 , Ingredient: mealsDteailArray[0].strIngredient7)
        setupIngredients(measure: mealsDteailArray[0].strMeasure8 , Ingredient: mealsDteailArray[0].strIngredient8)
        setupIngredients(measure: mealsDteailArray[0].strMeasure9 , Ingredient: mealsDteailArray[0].strIngredient9)
        setupIngredients(measure: mealsDteailArray[0].strMeasure10 , Ingredient: mealsDteailArray[0].strIngredient10)
        setupIngredients(measure: mealsDteailArray[0].strMeasure11 , Ingredient: mealsDteailArray[0].strIngredient11)
        setupIngredients(measure: mealsDteailArray[0].strMeasure12 , Ingredient: mealsDteailArray[0].strIngredient12)
        setupIngredients(measure: mealsDteailArray[0].strMeasure13 , Ingredient: mealsDteailArray[0].strIngredient13)
        setupIngredients(measure: mealsDteailArray[0].strMeasure14 , Ingredient: mealsDteailArray[0].strIngredient14)
        setupIngredients(measure: mealsDteailArray[0].strMeasure15 , Ingredient: mealsDteailArray[0].strIngredient15)
        setupIngredients(measure: mealsDteailArray[0].strMeasure16 , Ingredient: mealsDteailArray[0].strIngredient16)
        setupIngredients(measure: mealsDteailArray[0].strMeasure17 , Ingredient: mealsDteailArray[0].strIngredient17)
        setupIngredients(measure: mealsDteailArray[0].strMeasure18 , Ingredient: mealsDteailArray[0].strIngredient18)
        setupIngredients(measure: mealsDteailArray[0].strMeasure19 , Ingredient: mealsDteailArray[0].strIngredient19)
        setupIngredients(measure: mealsDteailArray[0].strMeasure20 , Ingredient: mealsDteailArray[0].strIngredient20)
       
        
        
    }

}

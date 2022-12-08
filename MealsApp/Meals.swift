//
//  Meals.swift
//  MealsApp
//
//  Created by Amel Sbaihi on 12/5/22.
//

import Foundation

struct Meals : Codable  {
    
   var  meals = [Meal]()
    
}



struct Meal : Codable {
    
    var strMeal : String
    var idMeal : String
    
}




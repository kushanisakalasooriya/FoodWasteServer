//
//  CaloriesCalculatorsTest.swift
//  CaloriesCalculatorsTest
//
//  Created by Kushani Sakalasooriya on 2023-04-19.
//

import XCTest
import CoreData

final class CaloriesCalculatorsTest: XCTestCase {
    
    // Test the calculation of Fats
    func test_Calculations_Fats() {
        let sut = NutritionalCalculatorVC()
        
        let actual = sut.calcFatsforFoods(inGrams: 100, inCategory: "Green onions")
        let expected = "0.1"
        
        XCTAssertEqual(actual, expected)
    }
    
    // Test the calculation of Proteins
    func test_Calculations_Proteins() {
        let sut = NutritionalCalculatorVC()
        
        let actual = sut.calcProteinsforFoods(inGrams: 100, inCategory: "Carrots")
        let expected = "0.9"
        
        XCTAssertEqual(actual, expected)
    }
    
    // Test the calculation of Carbohydrates
    func test_Calculations_Carbohydrates() {
        let sut = NutritionalCalculatorVC()
        
        let actual = sut.calcCarbohydratesforFoods(inGrams: 100, inCategory: "Potatoes")
        let expected = "17.0"
        
        XCTAssertEqual(actual, expected)
    }
    
    // Test the calculation of TotalCalaries
    func test_Calculations_TotalCalaries() {
        let sut = NutritionalCalculatorVC()
        
        let actual = sut.calcTotalCalariesforFoods(inGrams: 100, inCategory: "Tomatoes")
        let expected = "18.0"
        
        XCTAssertEqual(actual, expected)
    }

}

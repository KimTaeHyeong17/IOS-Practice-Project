//
//  CardModel.swift
//  Match App
//
//  Created by 김태형 on 03/06/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import Foundation

class CardModel{
    
    func getCards() -> [Card] {
        
        var generatedNumbersArray = [Int]()
        
        //Declare an array to store the generated cards
        var generatedCardsArray = [Card]()
       
        //Randomly generate pairs of cards
        while generatedNumbersArray.count < 8 {
    
            //get a random number
            let randomNumber = arc4random_uniform(13) + 1
            
            if generatedNumbersArray.contains(Int(randomNumber)) == false{
                
                //Log the number
                print("gnerating random number \(randomNumber)")
                
                generatedNumbersArray.append(Int(randomNumber))
                
                //create the first card object
                let cardOne = Card()
                cardOne.imageName = "card\(randomNumber)"
                generatedCardsArray.append(cardOne)
                
                //create the second card object
                let cardTwo = Card()
                cardTwo.imageName = "card\(randomNumber)"
                generatedCardsArray.append(cardTwo)
                
                // OPTIONAL: Make it so we only have unique pairs of cards
                
                
                
            }
            
        } // 8 pairs of card --> total of 16 cards
        
        
        // TODO: Randomize the array
        for index in 0..<generatedCardsArray.count{
            let randomNumber = arc4random_uniform(13) + 1

            generatedCardsArray.swapAt(index, Int(randomNumber))
        }
        
        //Return the array
        return generatedCardsArray
    }
    
}

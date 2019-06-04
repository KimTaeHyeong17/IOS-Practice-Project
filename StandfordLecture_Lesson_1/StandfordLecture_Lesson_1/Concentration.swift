//
//  Concentration.swift
//  StandfordLecture_Lesson_1
//
//  Created by 김태형 on 28/05/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import Foundation

class Concentration{
    //empty array
    //var cards = Array<Card> () ==> same
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get{
            var foundIndex : Int?
            for index in cards.indices{
                if cards[index].isFaceUp{
                    if foundIndex == nil{
                        foundIndex = index
                    }else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue) //set(newValue)
            }
        }
    }
    
    func chooseCard(at index : Int) {
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }else{
                //either no cards or 2 cards are face up
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        //        if cards[index].isFaceUp{
        //            cards[index].isFaceUp = false
        //        }else{
        //            cards[index].isFaceUp = true
        //        }
    }
    
    init(numberOfPairsOfCards : Int) {
        for _ in 1 ... numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
            //            cards.append(card)
            //            cards.append(card)
        }
        //TODO : Shuffle the cards
        for _ in 1...cards.count{
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            cards.swapAt(0, randomIndex)
        }
    }
}

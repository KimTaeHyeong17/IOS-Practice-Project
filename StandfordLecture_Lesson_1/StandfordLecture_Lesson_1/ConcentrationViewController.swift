//
//  ViewController.swift
//  StandfordLecture_Lesson_1
//
//  Created by 김태형 on 28/05/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!  //Array<UIButton>
    
    
    lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int{
        
        return (cardButtons.count+1)/2
        
    }
    
    var flipCount = 0 {
        didSet{ //execute everytime things get set (property observer)
            flipCountLabel.text = "Flips : \(flipCount)"
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount  += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            print("cardNumber = \(cardNumber)")
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("chosen card was not in cardButtons")
        }
    }
    
    
    
    @IBAction func startNewGame(_ sender: Any) {
        flipCount = 0
        emojiChoices += emoji.values
        emoji = [Int:String]()
        for index in cardButtons.indices{
            let button = cardButtons[index]
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.962890327, green: 0.4403577447, blue: 0.1836077273, alpha: 1)
            game.cards[index].isFaceUp = false
            game.cards[index].isMatched = false
            game.indexOfOneAndOnlyFaceUpCard = nil
        }
    }
    
    
    func updateViewFromModel() {
        for index in 0..<cardButtons.count{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for:.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var theme: String? {
        didSet{
            emojiChoices = [theme ?? ""]
            emoji = [:]
            updateViewFromModel()
        }
    }
    
    var emojiChoices: Array<String> = ["👻","🎃","🌝","🌚","🐑","🍙","🍰","⚽️"]
    
    //var emoji = Dictionary<Int,String>()
    var emoji = [Int:String]()
    func emoji(for card: Card) -> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        //        if emoji[card.identifier] != nil{
        //            return emoji[card.identifier]!
        //        }else{
        //            return "?"
        //        } ==> same
        return emoji[card.identifier] ?? "?" //ifyou don't have emoji return ?
    }
}



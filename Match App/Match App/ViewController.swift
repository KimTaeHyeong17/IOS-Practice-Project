//
//  ViewController.swift
//  Match App
//
//  Created by 김태형 on 03/06/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    var model = CardModel()
    var cardArray = [Card]()
    
    var firstFlippedCardIndex :IndexPath?
    
    var timer:Timer?
    var miliseconds:Float = 60 * 1000 //10 seconds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardArray = model.getCards()
        
        CollectionView.delegate = self
        CollectionView.dataSource = self
        
        //create Timer
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
        
        RunLoop.main.add(timer!, forMode: .common)
        
    }
    
    //MARK: -Timer methods
    @objc func timerElapsed(){
        miliseconds -= 1
        //Convert to seconds
        let seconds = String(format: "%.2f", miliseconds/1000)
        timerLabel.text = "Time Remaining : \(seconds)"
        
        //when timer reached 0
        if miliseconds <= 0 {
            
            timer?.invalidate()
            timerLabel.textColor = UIColor.red
            
            //Check if there are any cards unmatched
            checkGameEnded()
            
            
        }
        
    }
    
    
    // MARK : -UICollectionView Protocol Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Get an CardCollectionViewCell object
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell //cast to CardCollectionViewCell(! : sure it is CardCollectionViewCell
        
        //Get the card that the collection view is trying to display
        let card = cardArray[indexPath.row]
        
        //Set the card for the cell
        cell.setCard(card)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //check time is left
        if(miliseconds <= 0) {
            return }
        
        //Get the cell that the user selected
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        //Get the card thet the user selected
        let card = cardArray[indexPath.row]
        if card.isFlipped == false && card.isMatched == false{
            
            cell.flip()
            card.isFlipped = true
            
            //Determine if it's the first card or second card
            if firstFlippedCardIndex == nil{
                
                //This is the first card being flipped
                firstFlippedCardIndex = indexPath
                
            }else{
                //This is the second card being flipped
                
                
                //TODO:perform the matching logic
                checkForMatches(indexPath)
                
            }
            
        }else{
            
            cell.flipBack()
            card.isFlipped = false
        }
        
        //flip the card
        print("touched \(indexPath.row)")
        
    }//end the didselectitemat method
    
    
    
    //MARK: - Game Logic Mehtods
    func checkForMatches(_ secondFilppedCardIndex : IndexPath){
        
        //Get the cells for the two cards that were revealed
        let cardOneCell = CollectionView.cellForItem(at : firstFlippedCardIndex!) as? CardCollectionViewCell
        
        let cardTwoCell = CollectionView.cellForItem(at: secondFilppedCardIndex) as? CardCollectionViewCell
        
        //Get the cards for the two cards that were revealed
        let cardOne = cardArray[firstFlippedCardIndex!.row]
        let cardTwo = cardArray[secondFilppedCardIndex.row]
        
        //compare the two cards
        if cardOne.imageName == cardTwo.imageName {
            //matched
            
            //set the statues of the cards
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            //remove the cards from the grid
            cardOneCell?.remove()
            cardTwoCell?.remove()
            
            //Check if there are any cards left unmatched
            checkGameEnded()
            
        }else{
            //not matched
            
            //set status of cards
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            
            //flip both cards back
            cardOneCell?.flipBack()
            cardTwoCell?.flipBack()
        }
        //Tell the collectionview to reload the cell of the first card if it is nil
        if cardOneCell == nil{
            CollectionView.reloadItems(at: [firstFlippedCardIndex!])
        }
        //reset the property
        firstFlippedCardIndex = nil
        
        
    }
    
    func checkGameEnded(){
        //Determine if there are any cards unmatched
        var isWon = true
        for card in cardArray{
            if card.isMatched == false{
                isWon = false
                break
            }
        }
        // Messaging variable
        var title = ""
        var message = ""
        //If not user has won, stop the timer
        if isWon == true {
            
            if miliseconds > 0{
                timer?.invalidate()
            }
            title = "Congratulations!"
            message = "You've Won"
            
        }else{
            //if there are unmatcehd cards, check if there's any time left
            if miliseconds > 0{
                return
            }
            title = "Game Over"
            message = "You've lost"
            
        }
        
        showAlert(title, message)
    }
    
    func showAlert(_ title:String, _ message:String){
        
        //show won/lost message
        let alert = UIAlertController(title: title, message: message, preferredStyle:  .alert)
        let aleartaction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(aleartaction)
        present(alert,animated: true,completion: nil)
    }
    
    
    
    
    
} //End viewcontroller class


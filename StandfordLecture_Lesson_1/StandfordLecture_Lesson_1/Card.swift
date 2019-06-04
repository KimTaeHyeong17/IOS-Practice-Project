//
//  Card.swift
//  StandfordLecture_Lesson_1
//
//  Created by 김태형 on 28/05/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import Foundation

struct Card{
    //two major difference
    //1. struct : no inherit,
    //2. struct : value type ==> copy, class : reference type ==> point
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var indentifierFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        indentifierFactory += 1
        return indentifierFactory
    }
    
    //UI independent so no emoji needed

    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
    
}

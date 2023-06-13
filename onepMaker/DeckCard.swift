//
//  DeckCard.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/13.
//

import Foundation
import RealmSwift

class DeckCard: Object{
    @Persisted var card: Card?
    @Persisted var number: Int
    
    convenience init(card: Card, number: Int) {
        
        self.init()
        
        self.card = card
        self.number = number
    }
}

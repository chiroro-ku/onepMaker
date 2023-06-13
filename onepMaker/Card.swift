//
//  Card.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/12.
//

import Foundation
import RealmSwift

class Card: Object {
    @Persisted var id: String
    @Persisted var info: String
    @Persisted var name: String
    @Persisted var cost: String
    @Persisted var attribute: String
    @Persisted var power: String
    @Persisted var counter: String
    @Persisted var color: String
    @Persisted var feature: String
    @Persisted var text: String
    
    convenience init(csvData data: String) {
        
        self.init()
        
        let cardData = data.components(separatedBy: ",")
        
        self.id = cardData[0]
        self.info = cardData[1]
        self.name = cardData[2]
        self.cost = cardData[3]
        self.attribute = cardData[4]
        self.power = cardData[5]
        self.counter = cardData[6]
        self.color = cardData[7]
        self.feature = cardData[8]
        self.text = cardData[9]
    }
}

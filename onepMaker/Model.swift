//
//  Model.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/11.
//

import Foundation
import RealmSwift

class Model{
    
    let fileName = "CardList"
    
    var data = [String]()
    
    func deleteAll(){
        let realm = try! Realm()
        try! realm.write{
            realm.deleteAll()
        }
    }
    
    func leaderCardAll() -> Results<Card>{
        let realm = try! Realm()
        let result = realm.objects(Card.self).filter("info == 'LEADER'")
        return result
    }
    
    func deckCardAll(leaderColor: String) -> Results<Card>{

        var colorMacro = "color == '\(leaderColor)'"
        
        if leaderColor.contains("/"){
            let leaderColors = leaderColor.components(separatedBy: "/")
            colorMacro = "color == '\(leaderColors[0])' || color == '\(leaderColors[1])'"
        }
        
        let realm = try! Realm()
        let result = realm.objects(Card.self).filter("info != 'LEADER'").filter(colorMacro)
        
        return result
    }
    
    func addDeckCard(card: Card){
        
        let number = self.deckCardNumber(id: card.id) + 1
        let deckCard = DeckCard(card: card, number: number)
        
        let realm = try! Realm()
        try! realm.write{
            realm.add(deckCard)
        }
        
    }
    
    func deleteDeckCard()
    
    func deckCardNumber(id: String) -> Int{
        
        let realm = try! Realm()
        let number = realm.objects(DeckCard.self).filter("card.id == '\(id)'").count
        
        return number
    }
    
    func csvDataLoad(){
        
        let count = self.leaderCardAll().count
        if count != 0 {
            return
        }
        
        guard let path = Bundle.main.path(forResource: fileName, ofType: "csv") else {
            print("path error")
            return
        }
        
        do{
            let aData = try String(contentsOfFile: path, encoding: .utf8)
            self.data = aData.components(separatedBy: "\r\n")
            self.data.removeLast()
        }catch let error as NSError {
            print("\(error)")
        }
        
        for aData in self.data {
            
            let card = Card(csvData: aData)
            
            let realm = try! Realm()
            try! realm.write {
                realm.add(card)
            }
        }
    }
}

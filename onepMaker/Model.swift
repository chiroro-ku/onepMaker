//
//  Model.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/11.
//

import Foundation
import RealmSwift

class Model{
    
    let onepCardWidth: CGFloat = 63
    let onepCardHeght: CGFloat = 88
    let fileName = "CardList"
    
    var data = [String]()
    
    func toWidth(height: CGFloat) -> CGFloat {
        return height * self.onepCardWidth / self.onepCardHeght
    }
    
    func toHeight(width: CGFloat) -> CGFloat {
        return width * self.onepCardHeght / self.onepCardWidth
    }
    
    func deleteAll(){
        let realm = try! Realm()
        try! realm.write{
            realm.deleteAll()
        }
    }
    
    func getLeaderCardAll() -> Results<Card>{
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
    
    func deleteDeckCard(card: Card) {
        
        let realm = try! Realm()
        
        let number = realm.objects(DeckCard.self).filter("card.id == '\(card.id)'").count
        let deckCard = realm.objects(DeckCard.self).filter("card.id == '\(card.id)'").filter("number == \(number)")
        
        try! realm.write{
            realm.delete(deckCard)
        }
        
    }
    
    func deleteDeckCardAll(){
        
        let realm = try! Realm()
        let result = realm.objects(DeckCard.self)
        try! realm.write {
            realm.delete(result)
        }
        
    }
    
    func deckCardNumber(id: String) -> Int{
        
        let realm = try! Realm()
        let number = realm.objects(DeckCard.self).filter("card.id == '\(id)'").count
        
        return number
    }
    
    func deckCardAll(leader: Bool = false) -> Results<DeckCard>{
        
        var infoMacro = "card.info != 'LEADER'"
        
        if leader {
            infoMacro = "card.info != '-'"
        }
        
        let realm = try! Realm()
        let result = realm.objects(DeckCard.self).filter(infoMacro)
        
        return result
    }
    
    func deckCardNumber() -> Int{
        let realm = try! Realm()
        let number = realm.objects(DeckCard.self).filter("card.info != 'LEADER'").count
        
        return number
    }
    
    func csvDataLoad(){
        
        let count = self.getLeaderCardAll().count
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

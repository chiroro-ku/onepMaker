//
//  DeckCardViewController.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/13.
//

import UIKit

class DeckCardViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    
    var deckCard = DeckCard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let id = self.deckCard.card?.id {
            self.cardImageView.image = UIImage(named: id)
        }
        
        self.numberLoad()
    }
    
    func numberLoad(){
        let model = Model()
        if let id = self.deckCard.card?.id {
            self.numberLabel.text = "\(model.deckCardNumber(id: id))"
        }
    }
    
    @IBAction func addDeckCardViewController(_ sender: Any) {
        
        let model = Model()
        if let card = self.deckCard.card {
            model.addDeckCard(card: card)
        }
        
        self.numberLoad()
    }
    
    @IBAction func deleteDeckCardViewController(_ sender: Any) {
        
        let model = Model()
        if let card = self.deckCard.card {
            model.deleteDeckCard(card: card)
        }
        
        self.numberLoad()
    }
}

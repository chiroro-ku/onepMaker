//
//  CharactoerCardViewController.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/10.
//

import UIKit

class CharacterCardViewController: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    
    var characterCard = Card()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let id = self.characterCard.id
        self.cardImageView.image = UIImage(named: id)
        
        self.numberLoad()
    }
    
    func numberLoad(){
        let model = Model()
        let id = self.characterCard.id
        self.numberLabel.text = "\(model.deckCardNumber(id: id))"
    }
    
    @IBAction func addCardButtonTapped(_ sender: Any) {
        let model = Model()
        model.addDeckCard(card: self.characterCard)
        
        self.numberLoad()
    }
    
    @IBAction func deleteCardButtonTapped(_ sender: Any) {
        let model = Model()
        model.deleteDeckCard(card: self.characterCard)
        
        self.numberLoad()
    }
}

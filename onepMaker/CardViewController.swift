//
//  CardViewController.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/15.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var numberButton: Button!
    
    let model = Model()
    
    var card = Card()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let id = self.card.id
        self.cardImageView.image = UIImage(named: id)
    }
    
    func numberLoad(){
        let id = self.card.id
        let number = self.model.deckCardNumber(id: id)
        self.numberButton.setTitle("\(number)", for: .normal)
    }
    
    @IBAction func deleteDeckCardButtonTapped(_ sender: Any) {
        self.model.deleteDeckCard(card: self.card)
        self.numberLoad()
    }
    
    @IBAction func addDeckCardButtonTapped(_ sender: Any) {
        self.model.addDeckCard(card: self.card)
        self.numberLoad()
    }
}

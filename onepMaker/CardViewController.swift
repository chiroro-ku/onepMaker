//
//  CardViewController.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/15.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    
    let model = Model()
    
    var card = Card()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let id = self.card.id
        self.cardImageView.image = UIImage(named: id)
    }
    
    @IBAction func deleteDeckCardButtonTapped(_ sender: Any) {
        self.model.deleteDeckCard(card: self.card)
    }
    
    @IBAction func addDeckCardButtonTapped(_ sender: Any) {
        self.model.addDeckCard(card: self.card)
    }
}
//
//  LeadCardViewController.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/08.
//

import UIKit

class LeaderCardViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    
    let model = Model()
    
    var leadCard = Card()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let id = self.leadCard.id
        self.cardImageView.image = UIImage(named: id)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCardListViewController" {
            
            let characterCardsViewController = segue.destination as! CardListViewController
            characterCardsViewController.leaderCard = self.leadCard
            
            self.model.deleteDeckCardAll()
            self.model.addDeckCard(card: leadCard)
            
        }
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toCardListViewController", sender: nil)
    }
}

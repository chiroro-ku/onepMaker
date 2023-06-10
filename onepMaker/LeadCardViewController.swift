//
//  LeadCardViewController.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/08.
//

import UIKit

class LeadCardViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    
    var leadCard = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cardImageView.image = UIImage(named: leadCard)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCharacterCardsViewController" {
            
        }
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toCharacterCardsViewController", sender: nil)
    }
}

//
//  CharactoerCardViewController.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/10.
//

import UIKit

class CharacterCardViewController: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    var characterCard = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.cardImageView.image = UIImage(named: characterCard)
    }
}

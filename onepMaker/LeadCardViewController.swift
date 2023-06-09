//
//  LeadCardViewController.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/08.
//

import UIKit

class LeadCardViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var leadCard = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = UIImage(named: leadCard)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCardListViewController" {
            
        }
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toCardListViewController", sender: nil)
    }
}

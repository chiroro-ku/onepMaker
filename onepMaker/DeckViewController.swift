//
//  DeckViewController.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/10.
//

import UIKit
import RealmSwift

class DeckViewController: UIViewController {
    
    @IBOutlet weak var cardCollectionView: UICollectionView!
    @IBOutlet weak var doneButton: UIButton!
    
    let model = Model()
    
    var cardList: Results<DeckCard>!
    var selectedCard = DeckCard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cardCollectionView.dataSource = self
        self.cardCollectionView.delegate = self
        
        self.load()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toCardViewController" {
            
            guard let cardViewController = segue.destination as? CardViewController else {
                return
            }
            guard let card = self.selectedCard.card else {
                return
            }
            cardViewController.card = card
            cardViewController.delegate = self
            
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.load()
    }
    
    func cardListLoad(){
        self.cardList = self.model.deckCardAll()
        self.cardCollectionView.reloadData()
    }
    
    func deckNumberLoad(){
        
        let model = Model()
        let number = model.deckCardNumber()
        
        self.doneButton.setTitle("完成(\(number))", for: .normal)
        
        if number == 50 {
            self.doneButton.isEnabled = true
        }else{
            self.doneButton.isEnabled = false
        }
        
    }
}



extension DeckViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cardList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.cardCollectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath)
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        if let id = self.cardList[indexPath.row].card?.id {
            imageView.image = UIImage(named: id)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (self.cardCollectionView.bounds.width/4) - 1
        let height = self.model.toHeight(width: width)
        let cellSize = CGSize(width: width, height: height)
        
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        self.selectedCard = self.cardList[indexPath.row]
        performSegue(withIdentifier: "toCardViewController", sender: nil)
        
    }
}



extension DeckViewController: CardCollectionView {
    func load() {
        
        self.cardListLoad()
        self.deckNumberLoad()
        
    }
}

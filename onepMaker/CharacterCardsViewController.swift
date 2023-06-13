//
//  CharacterCardListViewController.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/09.
//

import UIKit
import RealmSwift

class CharacterCardsViewController: UIViewController {
    
    @IBOutlet weak var cardCollectionView: UICollectionView!
    @IBOutlet weak var deckButton: UIButton!
    
    var cardList: Results<Card>!
    var leaderCard = Card()
    var selectedCard = Card()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cardCollectionView.dataSource = self
        self.cardCollectionView.delegate = self
        
        let model = Model()
        let color = self.leaderCard.color
        self.cardList = model.deckCardAll(leaderColor: color)
        
        self.deckNumberLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toCharacterCardViewController" {
            let characterCardViewController = segue.destination as? CharacterCardViewController
            characterCardViewController?.characterCard = self.selectedCard
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.deckNumberLoad()
    }
    
    func deckNumberLoad() {
        
        let model = Model()
        let number = model.deckCardNumber()
        
        self.deckButton.setTitle( "デッキ(\(number))", for: .normal)
    }
}

extension CharacterCardsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cardList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.cardCollectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath)
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        let id = self.cardList[indexPath.row].id
        imageView.image = UIImage(named: id)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (self.cardCollectionView.bounds.width/4) - 1
        let height = width * 1.34
        let cellSize = CGSize(width: width, height: height)
        
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        self.selectedCard = self.cardList[indexPath.row]
        
        performSegue(withIdentifier: "toCharacterCardViewController", sender: nil)
    }
}

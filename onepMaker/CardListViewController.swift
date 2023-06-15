//
//  CharacterCardListViewController.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/09.
//

import UIKit
import RealmSwift

class CardListViewController: UIViewController {
    
    @IBOutlet weak var cardCollectionView: UICollectionView!
    @IBOutlet weak var deckButton: UIButton!
    
    let model = Model()
    
    var cardList: Results<Card>!
    var leaderCard = Card()
    var selectedCard = Card()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cardCollectionView.dataSource = self
        self.cardCollectionView.delegate = self
        
        self.load()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toCardViewController" {
            guard let characterCardViewController = segue.destination as? CardViewController else {
                return
            }
            characterCardViewController.card = self.selectedCard
            characterCardViewController.delegate = self
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.load()
    }
    
    func cardListLoad() {
        
        let color = self.leaderCard.color
        self.cardList = self.model.deckCardAll(leaderColor: color)
        self.cardCollectionView.reloadData()
        
    }
    
    func deckNumberLoad() {
        
        let number = self.model.deckCardNumber()
        self.deckButton.setTitle( "デッキ(\(number))", for: .normal)
        
    }
}



extension CardListViewController: CardCollectionView {
    func load() {
        
        self.cardListLoad()
        self.deckNumberLoad()
        
    }
}



extension CardListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
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
        let height = self.model.toHeight(width: width)
        let cellSize = CGSize(width: width, height: height)
        
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        self.selectedCard = self.cardList[indexPath.row]
        performSegue(withIdentifier: "toCardViewController", sender: nil)
        
    }
}

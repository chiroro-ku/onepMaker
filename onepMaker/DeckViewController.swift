//
//  DeckViewController.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/10.
//

import UIKit

class DeckViewController: UIViewController {
    
    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    var deckList = [String]()
    var selectedCharacterCard = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension DeckViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.deckList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.cardCollectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath)
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named:
    deckList[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (self.cardCollectionView.bounds.width/4) - 1
        let height = width * 1.34
        let cellSize = CGSize(width: width, height: height)
        
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        self.selectedCharacterCard = self.deckList[indexPath.row]
        
        performSegue(withIdentifier: "toCharacterCardViewController", sender: nil)
    }
}

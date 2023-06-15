//
//  ViewController.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/07.
//

import UIKit
import RealmSwift

class LeaderCardListViewController: UIViewController {

    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    let model = Model()
        
    var cardList: Results<Card>!
    var selectedCard = Card()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardCollectionView.dataSource = self
        cardCollectionView.delegate = self
        
        self.model.csvDataLoad()
        cardList = model.getLeaderCardAll()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toLeadCardViewController"{
            let leadCardViewController = segue.destination as? LeaderCardViewController
            leadCardViewController?.leadCard = self.selectedCard
        }
    }
}



extension LeaderCardListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.cardList.count
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
        
        performSegue(withIdentifier: "toLeadCardViewController", sender: nil)
    }
}

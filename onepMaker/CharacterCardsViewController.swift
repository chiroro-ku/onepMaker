//
//  CharacterCardListViewController.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/09.
//

import UIKit

class CharacterCardsViewController: UIViewController {
    
    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    var redCharacterCardList = ["OP01-004","OP01-005_p1","OP01-005_p2","OP01-005","OP01-006","OP01-007","OP01-008_p1","OP01-008","OP01-009","OP01-010","OP01-011","OP01-012","OP01-013_p1","OP01-013_p2","OP01-013","OP01-014_p1","OP01-014_p2","OP01-014","OP01-015","OP01-016_p1","OP01-016_p2","OP01-016","OP01-017_p1","OP01-017_p2","OP01-017","OP01-018","OP01-019","OP01-020","OP01-021_p1","OP01-021_p2","OP01-021_p3","OP01-021_p4","OP01-021","OP01-022_p1","OP01-022","OP01-023","OP01-024_p1","OP01-024","OP01-025_p1","OP01-025","OP01-026","OP01-027","OP01-028","OP01-029","OP01-030","OP01-120_p1","OP01-120_p2","OP01-120","OP02-003","OP02-004_p1","OP02-004_p2","OP02-004","OP02-005","OP02-006","OP02-007","OP02-008","OP02-009_p1","OP02-009","OP02-010","OP02-011","OP02-012","OP02-013_p1","OP02-013_p2","OP02-013","OP02-014","OP02-015","OP02-016","OP02-017_p1","OP02-017","OP02-018_p1","OP02-018","OP02-019","OP02-020","OP02-021","OP02-022","OP02-023","OP02-024","OP03-002","OP03-003","OP03-004","OP03-005","OP03-006","OP03-007","OP03-008","OP03-009","OP03-010","OP03-011","OP03-012","OP03-013_p1","OP03-013","OP03-014","OP03-015","OP03-016","OP03-017","OP03-018_p1","OP03-018","OP03-019","OP03-020","OP04-002","OP04-003","OP04-004","OP04-005","OP04-006","OP04-007","OP04-008","OP04-009","OP04-010","OP04-011","OP04-012","OP04-013_p1","OP04-013","OP04-014","OP04-015","OP04-016","OP04-017","OP04-018","OP04-118_p1","OP04-118","P-001_p1","P-001","P-002","P-006","P-007","P-012","P-013","P-014","P-015","P-016_p1","P-016_p2","P-016","P-017","P-018","P-019","P-020","P-021","P-022_p1","P-022_p2","P-022","P-023","P-027","P-028_p1","P-028","ST01-002_p1","ST01-002_p2","ST01-002_p3","ST01-002_p4","ST01-002","ST01-003_p1","ST01-003","ST01-004_p1","ST01-004_p2","ST01-004_p3","ST01-004_p4","ST01-004","ST01-005_p1","ST01-005_p2","ST01-005","ST01-006_p1","ST01-006_p2","ST01-006_p3","ST01-006_p4","ST01-006","ST01-007_p1","ST01-007_p2","ST01-007_p3","ST01-007_p4","ST01-007_p5","ST01-007","ST01-008_p1","ST01-008_p2","ST01-008","ST01-009_p1","ST01-009_p2","ST01-009","ST01-010_p1","ST01-010_p2","ST01-010","ST01-011_p1","ST01-011_p2","ST01-011_p3","ST01-011_p4","ST01-011","ST01-012_p1","ST01-012_p2","ST01-012","ST01-013_p1","ST01-013_p2","ST01-013_p3","ST01-013","ST01-014_p1","ST01-014","ST01-015_p1","ST01-015_p2","ST01-015_p3","ST01-015","ST01-016_p1","ST01-016","ST01-017_p1","ST01-017"]
    var selectedCharacterCard = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cardCollectionView.dataSource = self
        self.cardCollectionView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toCharacterCardViewController" {
            let characterCardViewController = segue.destination as? CharacterCardViewController
            characterCardViewController?.characterCard = self.selectedCharacterCard
        }
    }
}

extension CharacterCardsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.redCharacterCardList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.cardCollectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath)
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named:
    redCharacterCardList[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (self.cardCollectionView.bounds.width/4) - 1
        let height = width * 1.34
        let cellSize = CGSize(width: width, height: height)
        
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        self.selectedCharacterCard = self.redCharacterCardList[indexPath.row]
        
        performSegue(withIdentifier: "toCharacterCardViewController", sender: nil)
    }
}

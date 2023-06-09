//
//  ViewController.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    let leadCardList = ["OP01-001_p1","OP01-001_p2","OP01-001","OP01-002_p1","OP01-002","OP01-003_p1","OP01-003","OP01-031_p1","OP01-031","OP01-060_p1","OP01-060","OP01-061_p1","OP01-061","OP01-062_p1","OP01-062","OP01-091_p1","OP01-091","OP02-001_p1","OP02-001","OP02-002_p1","OP02-002","OP02-025_p1","OP02-025","OP02-026_p1","OP02-026","OP02-049_p1","OP02-049","OP02-071_p1","OP02-071","OP02-072_p1","OP02-072","OP02-093_p1","OP02-093","OP03-001_p1","OP03-001_p2","OP03-001","OP03-021_p1","OP03-021","OP03-022_p1","OP03-022","OP03-040_p1","OP03-040","OP03-058_p1","OP03-058","OP03-076_p1","OP03-076","OP03-077_p1","OP03-077","OP03-099_p1","OP03-099","OP04-001_p1","OP04-001","OP04-019_p1","OP04-019","OP04-020_p1","OP04-020","OP04-039_p1","OP04-039","OP04-040_p1","OP04-040","OP04-058_p1","OP04-058","P-011","ST01-001_p1","ST01-001","ST03-001","ST04-001","ST05-001","ST06-001","ST07-001","ST08-001","ST09-001"]
    var selectLeadCard = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardCollectionView.dataSource = self
        cardCollectionView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toLeadCardViewController"{
            let leadCardViewController = segue.destination as? LeadCardViewController
            leadCardViewController?.leadCard = self.selectLeadCard
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.leadCardList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.cardCollectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath)
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: 
    leadCardList[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (self.cardCollectionView.bounds.width/4) - 1
        let height = width * 1.34
        let cellSize = CGSize(width: width, height: height)
        
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        self.selectLeadCard = self.leadCardList[indexPath.row]
        performSegue(withIdentifier: "toLeadCardViewController", sender: nil)
    }
}

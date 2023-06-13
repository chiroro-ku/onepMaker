//
//  DoneCeckViewController.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/13.
//

import UIKit
import RealmSwift

class DoneDeckViewController: UIViewController {

    @IBOutlet weak var cardCollectionView: UICollectionView!
    @IBOutlet weak var saveButton: UIButton!
    
    var cardList: Results<DeckCard>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cardCollectionView.dataSource = self
        self.cardCollectionView.delegate = self
        
        let model = Model()
        self.cardList = model.deckCardAll(leader: true)
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        let image = self.cardCollectionView.image
        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
        self.saveButton.setTitle("OK", for: .normal)
    }
}

extension DoneDeckViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
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
        
        let width = ((self.cardCollectionView.bounds.width-10)/6) - 1
        let height = (self.cardCollectionView.bounds.height-10)/9
        
        /*
        let width = ((self.cardCollectionView.bounds.width)/6) - 1
        let height = width * 1.34
         */
        
        /*
        let height = (self.cardCollectionView.bounds.height/10)
        let width = height * 0.72
         */
        
        let cellSize = CGSize(width: width, height: height)
        
        print(cellSize)
        
        return cellSize
    }
}

extension UICollectionView{
    var image: UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        layer.render(in: context)
        let capturedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return capturedImage
    }
}

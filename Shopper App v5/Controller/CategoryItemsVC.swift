//
//  CategoryItemsVC.swift
//  Shopper App v5
//
//  Created by Gilang Sinawang on 06/12/20.
//

import UIKit

class CategoryItemsVC: UIViewController {

    @IBOutlet weak var ProductCollectionView: UICollectionView!
    
    var selectedCategory: String = ""
    var currentIndex = 0
    var product: [Int] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}


extension CategoryItemsVC: UICollisionBehaviorDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        for category in productCategory{
            if category == selectedCategory{
                product.append(currentIndex)
                print(product)
            }
            currentIndex += 1
        }
        return product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Category Items Cell", for: indexPath) as! CategoryItemsCell
        cell.ProductImage.image = UIImage(named: productName[product[indexPath.row]])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: 100, height: 100)
        let noOfCellsInRow = 2

            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

            let totalSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

            return CGSize(width: size, height: size)
    }
    
    
}

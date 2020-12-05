//
//  HomeVC.swift
//  Shopper App v5
//
//  Created by Gilang Sinawang on 05/12/20.
//

import UIKit

class HomeVC: UIViewController {

    
    @IBOutlet weak var HomeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Home Screen Loaded")

        // Do any additional setup after loading the view.
    }

}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home Cell", for: indexPath) as! HomeCell
        cell.HomeProductImage.image = UIImage(named: productName[indexPath.row])
        cell.HomeProductLabel.text = productName[indexPath.row]
        cell.HomePriceLabel.text = "\(productPrice[indexPath.row])"
        
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
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let screenWidth = UIScreen.main.bounds.width
//        let scaleFactor = (screenWidth / 2) - 6
//
//        return CGSize(width: scaleFactor, height: scaleFactor)
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? DetailVC, let index = HomeCollectionView.indexPathsForSelectedItems?.first {
            
            destination.selection = productID[index.row]
        }
        
    }
    
    
    
}

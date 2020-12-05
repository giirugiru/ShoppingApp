//
//  CartVC.swift
//  Shopper App v5
//
//  Created by Gilang Sinawang on 05/12/20.
//

import UIKit

class CartVC: UIViewController {

    @IBOutlet weak var CartCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Cart View Loaded")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func CheckOutButton(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Check Out", message: "Do you want to check out your items?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: { action in
                self.CartCollectionView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                shoppingCart.removeAll()
                self.CartCollectionView.reloadData()
        }))
        
        self.present(alert, animated: true, completion: nil)

    }
    

}

extension CartVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        shoppingCart.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cart Cell", for: indexPath) as! CartCell
        cell.ProductImage.image = UIImage(named: productName[shoppingCart[indexPath.row]])
        cell.ProductLabel.text = productName[shoppingCart[indexPath.row]]
        cell.ProductPrice.text = "\(productPrice[shoppingCart[indexPath.row]])"
        
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

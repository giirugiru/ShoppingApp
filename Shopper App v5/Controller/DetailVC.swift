//
//  DetailVC.swift
//  Shopper App v5
//
//  Created by Gilang Sinawang on 05/12/20.
//

import UIKit


class DetailVC: UIViewController {

    var selection: String!
    @IBOutlet weak var ProductImageView: UIImageView!
    
    @IBOutlet weak var ProductNameLabel: UILabel!
    
    @IBOutlet weak var ProductPriceLabel: UILabel!
    
    @IBOutlet weak var ProductCategoryLabel: UILabel!
    
    @IBOutlet weak var ProductVariantLabel: UILabel!
    
    @IBOutlet weak var ProductDescriptionLabel: UILabel!
    
    @IBOutlet weak var AddToCartButtonStyle: UIButton!
    
    
    @IBAction func AddToCartButton(_ sender: Any) {
        
        
        let ID = Int(selection)
        
        let alert = UIAlertController(title: "Add to cart", message: "Item Added to Cart!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            print(ID!)
            shoppingCart.append(ID!)
            print(shoppingCart)
        }))
        
        self.present(alert, animated: true, completion: nil)
        

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddToCartButtonStyle.layer.cornerRadius = 10
        
        print("Detail Screen Loaded")
        
        let ID = Int(selection)
        ProductImageView.image = UIImage(named: productName[ID!])
        ProductNameLabel.text = productName[ID!]
        ProductPriceLabel.text = "Rp. \(productPrice[ID!])"
        ProductCategoryLabel.text = "Category: \(productCategory[ID!])"
        ProductVariantLabel.text = "Variant: \(productVariant[ID!])"
        ProductDescriptionLabel.text = productDescription[ID!]
        ProductDescriptionLabel.sizeToFit()
                
        
        // Do any additional setup after loading the view.
    }
    

    

}

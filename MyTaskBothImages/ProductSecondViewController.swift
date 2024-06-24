//
//  ProductSecondViewController.swift
//  MyTaskBothImages
//
//  Created by Macintosh on 21/05/24.
//

import UIKit
import Kingfisher
//import ScreenTime
class ProductSecondViewController: UIViewController {
    var product : [Product] = []
    var image : [String] = []
    
//    var timer : Timer?
//    var currnetCellIndex = 0
    @IBOutlet weak var productCollectionView: UICollectionView!
    var productContainer : Product?
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXIBWithTableView()
        initialize()
        
//        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)

    }
    
//    @objc func timerAction() {
//        if currnetCellIndex < image.count - 1 {
//            currnetCellIndex += 1
//
//        } else {
//            currnetCellIndex = 0
//        }
//        productCollectionView.scrollToItem(at: IndexPath(item: currnetCellIndex, section: 0), at: .right, animated: true)
//    }
 func initialize(){
        productCollectionView.dataSource = self
     productCollectionView.delegate = self
    }
    func registerXIBWithTableView(){
        let uiNib = UINib(nibName: "productCollectionViewCell", bundle: nil)
        self.productCollectionView.register(uiNib, forCellWithReuseIdentifier: "productCollectionViewCell")
    }
}
extension ProductSecondViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productCollectionView = self.productCollectionView.dequeueReusableCell(withReuseIdentifier: "productCollectionViewCell", for: indexPath) as! productCollectionViewCell
     
//productCollectionView.discriptionLabel.text = product[indexPath.item].description
//        productCollectionView.creationAtLabel.text = String(product[indexPath.item].creationAt)
        
           let imageUrl = image[indexPath.row]
           if let url = URL(string: imageUrl) {
               productCollectionView.imagesView.kf.setImage(with: url)
           } else {
               print("invalid")
           }
           return productCollectionView
        
    }
    
    
}
extension ProductSecondViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowlayout = collectionViewLayout as! UICollectionViewFlowLayout

        let speceBetweenTheCells : CGFloat = (flowlayout.minimumInteritemSpacing ?? 0.0 ) + (flowlayout.sectionInset.left ) + (flowlayout.sectionInset.right  )

        let size = (self.productCollectionView.frame.width - speceBetweenTheCells) / 2.0
        return CGSize(width: size, height: size)
    }

}


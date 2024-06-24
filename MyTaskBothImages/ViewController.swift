//
//  ViewController.swift
//  MyTaskBothImages
//
//  Created by Macintosh on 20/05/24.
//

import UIKit
import Kingfisher


class ViewController: UIViewController {
    var products : [Product] = []
    var url : URL?
    var jsonDecoder : JSONDecoder?
    var urlRequest : URLRequest?
    var urlSession : URLSession?
    
    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        initializerTableView()
        registerXIBWithTableView()
    }
    func registerXIBWithTableView(){
        let uiNib = UINib(nibName: "productTableViewCell", bundle: nil)
        self.productTableView.register(uiNib, forCellReuseIdentifier: "productTableViewCell")
    }
    func initializerTableView(){
        productTableView.dataSource = self
        productTableView.delegate = self
    }

func fetchData(){
    var url = URL(string: "https://api.escuelajs.co/api/v1/products")
    var urlRequest = URLRequest(url: url!)
    var urlSession = URLSession(configuration: .default)
    var dataTask = URLSession.shared.dataTask(with: urlRequest) { data, responce, error in
        self.products = try! JSONDecoder().decode([Product].self, from: data!)
        self.jsonDecoder = JSONDecoder()
        print(self.products)
        DispatchQueue.main.async {
            self.productTableView.reloadData()
        }
    }
    dataTask.resume()
}
}
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productTableView = self.productTableView.dequeueReusableCell(withIdentifier: "productTableViewCell", for: indexPath) as! productTableViewCell

        productTableView.idLabel.text = String(products[indexPath.row].id)
        productTableView.titleLabel.text = String(products[indexPath.row].title)
        productTableView.pricelabel.text = String(products[indexPath.row].price)
        productTableView.categoryIdLabel.text = String(products[indexPath.row].category.id)

        let imageUrl = products[indexPath.row].category.image
        if let url = URL(string: imageUrl) {
            productTableView.mainProductImageLabel.kf.setImage(with: url)
        } else {
            print("invalid")
        }
        return productTableView
    }


}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        330.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productSecondViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProductSecondViewController") as! ProductSecondViewController
        productSecondViewController.image = products[indexPath.row].images
        productSecondViewController.productContainer = products[indexPath.row]
        self.navigationController?.pushViewController(productSecondViewController, animated: true)


    }
}

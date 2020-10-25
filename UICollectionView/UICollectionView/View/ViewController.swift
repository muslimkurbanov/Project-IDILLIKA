//
//  ViewController.swift
//  UICollectionView
//
//  Created by Муслим Курбанов on 22.10.2020.
//

import UIKit
import SDWebImage

protocol ViewProtocol: class {
    func applyData(model: [Menu])
    func failure(error: Error)
}

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var searchResponse = [Menu]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var presenter: ViewPresetnerProtocol!
    private let favoriteManager = CartManager.shared
    
    var itemMenuArray: [Menu] = {
        var blankMenu = Menu()
        blankMenu.brand = "CocaCola"
        blankMenu.imageLink = "cola"
        print("blankMenu")
        return [blankMenu]
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MainViewPresenter(view: self)

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return itemMenuArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? CollectionViewCell {
            
            itemCell.menu = itemMenuArray[indexPath.row]
            return itemCell
        }
        return UICollectionViewCell()
    }
    
    
}

extension ViewController: ViewProtocol {
    func applyData(model: [Menu]) {
        searchResponse.append(contentsOf: model)

    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    
}

//
//  MenuUserSettings.swift
//  UICollectionView
//
//  Created by Муслим Курбанов on 25.10.2020.
//

import Foundation

class CartManager {
    static let shared = CartManager()
    private init() {}
    
    private let defaults = UserDefaults.standard
    private let menuKey = "MENU_PRODUCT"
    
    var dishesIds: [Int: Int] {
        guard let decoded  = defaults.object(forKey: menuKey) as? Data else { return [:] }
        let array = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded) as? [Int: Int]
        return array ?? [:]
    }
    
    func getDishCount(by id: Int) -> Int? {
        return dishesIds[id]
    }
    
    func plusDishes(_ id: Int) {
        var dishesCopy = dishesIds
        if dishesCopy[id] != nil {
            dishesCopy[id]! += 1
        } else {
            dishesCopy[id] = 1
        }
        
        let encodedData = try? NSKeyedArchiver.archivedData(withRootObject: dishesCopy, requiringSecureCoding: false)
        defaults.set(encodedData, forKey: menuKey)
    }
    
    
}


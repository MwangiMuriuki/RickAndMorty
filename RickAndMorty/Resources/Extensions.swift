//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 22/02/2024.
//

import UIKit


extension UIView {
    /// Custom Function to Add Multiple Subviews at the same time
    /// - Parameter views: The Views you want to add
    func addSubviews(_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}

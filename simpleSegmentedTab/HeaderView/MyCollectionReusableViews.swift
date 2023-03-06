//
//  MyCollectionReusableView.swift
//  simpleSegmentedTab
//
//  Created by BRIMO on 06/03/23.
//

import UIKit

class MyCollectionReusableViews: UICollectionReusableView {
    static let reuseIdentifierHeader = "MyId"
    
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var mainIconView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        boxView.layer.borderColor = UIColor.yellow.cgColor
        boxView.layer.borderWidth = 1
        boxView.backgroundColor = UIColor.systemTeal
        boxView.layer.cornerRadius = 10
        
        mainTextLabel.text = "Test ini adalah sebuah text yang harusnya panjang"
        mainTextLabel.numberOfLines = 0
        
        
    }
    
}

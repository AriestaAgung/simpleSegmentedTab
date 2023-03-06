//
//  exampleCell.swift
//  simpleSegmentedTab
//
//  Created by BRIMO on 05/03/23.
//

import UIKit

class exampleCell: UICollectionViewCell {
    
    @IBOutlet weak var mainText: UILabel!
    
    static let NIB: UINib = UINib(nibName: "exampleCell", bundle: nil)
    static let identifier: String = "exampleCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}

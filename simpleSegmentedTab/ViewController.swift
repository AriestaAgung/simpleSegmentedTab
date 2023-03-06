//
//  ViewController.swift
//  simpleSegmentedTab
//
//  Created by BRIMO on 04/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var firstCollHeight: NSLayoutConstraint!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    @IBOutlet weak var secondColHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    let items: [String] = [
        "item 1",
        "item 2",
        "item 3"
    ]
    
    let items2: [String] = [
        "item 1",
        "item 2",
        "item 3",
        "item 1",
        "item 2",
        "item 3",
        "item 1",
        "item 2",
        "item 3",
        "item 1",
        "item 2",
        "item 3",
        "item 1",
        "item 2",
        "item 3",
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
        self.firstCollectionView.register(exampleCell.NIB, forCellWithReuseIdentifier: exampleCell.identifier)
        self.secondCollectionView.register(exampleCell.NIB, forCellWithReuseIdentifier: exampleCell.identifier)
        self.firstCollectionView.dataSource = self
        self.firstCollectionView.delegate = self
        self.firstCollectionView.allowsSelection = false
        self.firstCollHeight.constant = CGFloat(items.count * 60)
        
        self.secondCollectionView.dataSource = self
        self.secondCollectionView.delegate = self
        self.secondColHeight.constant = CGFloat(items2.count * 60)
        
        segmentedControl.addTarget(self, action: #selector(itemChanged(_:)), for: .valueChanged)
    }
    
    
    @objc private func itemChanged(_ sender: UISegmentedControl) {
        print("item: \(items[sender.selectedSegmentIndex])")
        var frame = scrollView.frame
        frame.origin.x = frame.size.width * CGFloat(sender.selectedSegmentIndex ?? 0)
        scrollView.scrollRectToVisible(frame, animated: true)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == firstCollectionView {
            return items.count
        } else {
            return items2.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: exampleCell.identifier, for: indexPath) as! exampleCell
        if collectionView == firstCollectionView {
            cell.mainText.text = items[indexPath.row]
        } else {
            cell.mainText.text = items2[indexPath.row]
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / 1.5
        return CGSize(width: size, height: size)
    }
    
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == self.scrollView {
            let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
            segmentedControl.selectedSegmentIndex = Int(pageIndex)
        }
    }
}

//
//  ViewController.swift
//  test
//
//  Created by Zed on 10.06.23.
//

import UIKit
import SwipeCellKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var stringList = ["Test","Test","Test","Test","Test","Test","Test","Test","Test"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.collection.register(HeaderReusableView.nib(), forCellWithReuseIdentifier: "cell")
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, SwipeCollectionViewCellDelegate {
    
    func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]? {
        
        guard orientation == .right else { return nil }

            let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
                // handle action by updating model with deletion
                
                self.stringList.removeFirst()
                self.collection.reloadData()

            }

            // customize the action appearance
            deleteAction.image = UIImage(named: "delete")
        
            return [deleteAction]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.stringList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
         cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collection.frame.width, height: self.collection.frame.height/8)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath) as! FooterReusableView
            return footer
        }
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! HeaderReusableView
        return header
    }
    
    
}

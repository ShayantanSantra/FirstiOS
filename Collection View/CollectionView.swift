//
//  CollectionView.swift
//  Test
//
//  Created by Shayantan Santra on 10/08/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import UIKit

class CollectionView: UIViewController {
    @IBOutlet var collectionView : UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize =  CGSize(width: 120, height: 120)
        collectionView.collectionViewLayout = layout
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension CollectionView :UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("It works")
    }
}
extension CollectionView :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.configure(with: UIImage(named: "Random_image")!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
}
extension CollectionView :UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}

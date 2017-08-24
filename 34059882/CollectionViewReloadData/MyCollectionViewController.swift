//
//  MyCollectionViewController.swift
//  CollectionViewReloadData
//
//  Created by Jonathan Baker on 8/24/17.
//  Copyright © 2017 HODINKEE Inc. All rights reserved.
//

import UIKit

final class MyCollectionViewController: UICollectionViewController {

    // MARK: - Properties

    fileprivate var itemCount: Int = 2


    // MARK: - Initializers

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 96, height: 96)
//        layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        // asynchronously update itemCount to simulate a network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            print("************* Updating Item Count... *************")
            self?.itemCount = 6
            self?.collectionView?.reloadData()

            // reloading the section "works", but creates an
            // undesirable animation
            // self?.collectionView?.reloadSections(IndexSet(integer: 0))
        }
    }


    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("collectionView(_:numberOfItemsInSection:\(section))", itemCount)
        return itemCount
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(#function, indexPath)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        cell.textLabel.text = "\(indexPath.item)"
        return cell
    }
}

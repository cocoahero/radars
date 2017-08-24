//
//  MyCollectionViewCell.swift
//  CollectionViewReloadData
//
//  Created by Jonathan Baker on 8/24/17.
//  Copyright © 2017 HODINKEE Inc. All rights reserved.
//

import UIKit

final class MyCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties

    let textLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .lightGray

        contentView.addSubview(textLabel)

        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

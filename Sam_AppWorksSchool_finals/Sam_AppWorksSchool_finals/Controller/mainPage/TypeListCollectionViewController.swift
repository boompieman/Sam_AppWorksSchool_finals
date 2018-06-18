//
//  TypeListCollectionViewController.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import UIKit


class TypeListCollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    var manager = ItemManager()

    var items = [Item]()
    
    override func viewDidLoad() {

        requestItems()
        setupCollectionView()

    }

    func setupCollectionView() {

        self.collectionView.delegate = self
        self.collectionView.dataSource = self

        let nib = UINib(nibName: String(describing: ItemCollectionViewCell.self), bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: String(describing: ItemCollectionViewCell.self))

    }

    func requestItems() {

        manager.delegate = self
        manager.getItems()
    }
}

extension TypeListCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return items.count

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ItemCollectionViewCell.self), for: indexPath)

        guard let itemCell = cell as? ItemCollectionViewCell else {return cell}

        itemCell.updateWith(imageUrl: self.items[indexPath.row].image)

        return itemCell
    }
}

extension TypeListCollectionViewController: ItemManagerDelegate {
    func manager(_ manager: ItemManager, didGet items: [Item]) {
        self.items = items

        self.collectionView.reloadData()
    }
}

extension TypeListCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let itemSize = CGSize(width: (self.collectionView.frame.width - 15) / 4, height: (self.collectionView.frame.height - 5) / 2)

        return itemSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        return 5
    }

}

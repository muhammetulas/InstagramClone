//
//  SearchViewController.swift
//  InstagramClone
//
//  Created by M Kaan Adanur on 18.03.2022.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = getCompositionalLayout()
    }
}


extension SearchViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exploreCell", for: indexPath) as! ExploreCell
        cell.cellImage.image = UIImage(named: "post1")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = view.bounds.width
        let cellWidth = (screenWidth - 2) / 3
        return CGSize(width: cellWidth, height: cellWidth)
    }
}

extension SearchViewController {
    func getCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        // Small Group
        let smallItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)))
        smallItem.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        
        let smallGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/6)), subitems: [smallItem])

        // Nested Groups
         let nestedGroup2Item1 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)))
        nestedGroup2Item1.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        
        let nestedGroup2 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2)), subitems: [nestedGroup2Item1])
        
        let nestedGroup1 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(4/6), heightDimension: .fractionalHeight(1)), subitems: [nestedGroup2, nestedGroup2])

        let group2Item1 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(2/6), heightDimension: .fractionalHeight(1)))
        group2Item1.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)

        let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [group2Item1,nestedGroup1])
        
        let group1 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [nestedGroup1,group2Item1])
        //--------- Container Group ---------//
        let containerGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(600)), subitems: [group1, smallGroup, smallGroup, group2])

        let section = NSCollectionLayoutSection(group: containerGroup)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

//
//  ProfileViewController.swift
//  InstagramClone
//
//  Created by M Kaan Adanur on 18.03.2022.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var postsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postsCollectionView.delegate = self
        postsCollectionView.dataSource = self
    }
    
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = postsCollectionView.dequeueReusableCell(withReuseIdentifier: "profilePostCell", for: indexPath) as! ProfilePostCell
        cell.profilePostImage.image = UIImage(named: "post1")
        return cell
    }
    
    
}

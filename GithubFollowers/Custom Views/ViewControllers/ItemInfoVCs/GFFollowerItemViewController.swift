//
//  GFFollowerItemViewController.swift
//  GithubFollowers
//
//  Created by Tilak Shakya on 07/07/24.
//

import UIKit

class GFFollowerItemViewController: GFItemInfoViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backGroundColor: .systemGreen, title: "Github Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}

//
//  GFRepoItemViewController.swift
//  GithubFollowers
//
//  Created by Tilak Shakya on 07/07/24.
//

import UIKit

class GFRepoItemViewController: GFItemInfoViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backGroundColor: .systemPurple, title: "Github Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}

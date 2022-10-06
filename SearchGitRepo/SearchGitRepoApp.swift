//
//  SearchGitRepoApp.swift
//  SearchGitRepo
//
//  Created by Mahmudul Hasan Razib on 10/7/22.
//

import SwiftUI

@main
struct SearchGitRepoApp: App {
    var body: some Scene {
        WindowGroup<GitRepoListView> {
            GitRepoListView(viewModel: GitRepoSearchViewModel())
        }
    }
}

//
//  RepoSearchList.swift
//  GitSearch
//
//  GitRepoListView.swift
//  SearchGitRepo
//
//  Created by Mahmudul Hasan Razib on 10/7/22.
//

import SwiftUI
import Combine

struct GitRepoListView: View {
    @ObservedObject var viewModel = GitRepoSearchViewModel()
    
    init(viewModel: GitRepoSearchViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Git search")
                    .font(Font.title.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                GitRepoSearchBar(placeholderText: "Search GitHub Repo..", textToSearch: $viewModel.searchText)
                List (viewModel.itmes, id: \.id) { item in
                    Text(item.htmlURL ?? "")
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct Repo_Previews: PreviewProvider {
    static var previews: some View {
        GitRepoListView(viewModel: GitRepoSearchViewModel())
    }
}

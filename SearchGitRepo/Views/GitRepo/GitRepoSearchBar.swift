//
//  GitRepoSearchBar.swift
//  SearchGitRepo
//
//  Created by Mahmudul Hasan Razib on 10/7/22.
//

import SwiftUI
import Combine

struct GitRepoSearchBar: UIViewRepresentable {

    var placeholderText: String
    @Binding var textToSearch: String

    class Coordinator: NSObject, UISearchBarDelegate {
        var placeholderText: String
        @Binding var textToSearch: String

        init(title: String, text: Binding<String>) {
            self.placeholderText = title
            _textToSearch = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            textToSearch = searchText
        }
    }
    
    func makeCoordinator() -> GitRepoSearchBar.Coordinator {
        return Coordinator(title: placeholderText, text: $textToSearch)
    }

    func makeUIView(context: UIViewRepresentableContext<GitRepoSearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.autocapitalizationType = .none
        searchBar.placeholder = placeholderText
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<GitRepoSearchBar>) {
        uiView.text = textToSearch
    }
}

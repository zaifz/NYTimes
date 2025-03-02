//
//  ArticlesView.swift
//  NYTimes
//
//  Created by Huzaifah Mohammed Haris on 27/02/25.
//

import SwiftUI

struct ArticlesView: View {
    
    @StateObject private var viewModel: ArticlesViewModel
    
    init(viewModel: ArticlesViewModel = ArticlesViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack {
                    Image(systemName: "line.horizontal.3")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Text("NY Times Most Popular")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .font(.headline)
                        .foregroundColor(.white)
                    Image(systemName: "ellipsis")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding()
                .background(Constants.AppColors.navBarColor)
                
                List(viewModel.articles, id: \.id) { article in
                    NavigationLink(destination: ArticleDetailView(viewModel: ArticleDetailsViewModel(article: article))) {
                        ArticleRow(article: article)
                    }
                }
                .listStyle(.plain)
                .padding(.top, -8)
                .task {
                    await viewModel.fetchArticles()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ArticlesView()
}

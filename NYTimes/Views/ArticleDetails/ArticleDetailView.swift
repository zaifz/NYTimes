//
//  ArticleDetailView.swift
//  NYTimes
//
//  Created by Huzaifah Mohammed Haris on 27/02/25.
//

import SwiftUI

struct ArticleDetailView: View {
    
    var viewModel: ArticleDetailsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(viewModel.article.title)
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text(viewModel.article.byline)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
            }
            Divider()
            Text(viewModel.article.abstract)
                .font(.body)
            Spacer()
        }
        .padding()
        .navigationTitle("New York Times")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(viewModel: ArticleDetailsViewModel(article: Article(id: 1, title: "Test 1", published_date: "1-2-3", byline: "By Test", abstract: "Test")))
    }
}

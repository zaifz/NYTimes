//
//  ArticleRow.swift
//  NYTimes
//
//  Created by Huzaifah Mohammed Haris on 01/03/25.
//

import Foundation
import SwiftUI

struct ArticleRow: View {
    let article: Article
    
    var body: some View {
        HStack(alignment: .center) {
            Circle()
                .fill(Color.gray.opacity(0.6))
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Text("\(article.byline)")
                    .font(.body)
                    .foregroundColor(.gray)
                HStack(spacing: 8) {
                    Spacer()
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 14, height: 14)
                        .foregroundColor(.gray)
                    Text(article.published_date)
                        .font(.body)
                        .foregroundColor(.gray)
                }
            }
            .padding(.leading, 8)
        }
    }
}

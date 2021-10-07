//
//  ArticleDetailsView.swift
//  News
//
//  Created by Kerim Njuhovic on 7. 10. 2021..
//

import SwiftUI
import Kingfisher

struct ArticleDetailsView: View {
    
    @State var article: Article
    
    var body: some View {
        VStack {
            if
                let urlToImage = article.urlToImage,
                let url = URL(string: urlToImage)
            {
                KFImage(url)
                    .frame(height: 200)
                    .background(Color(UIColor.systemFill))
                    .cornerRadius(5)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
            } else {
                Image(systemName: "photo.fill")
                    .foregroundColor(.black)
                    .frame(width: 100, height: 100)
            }
            
            Text(article.title)
                .titleStyle()
            Spacer()
            HStack(alignment: .firstTextBaseline) {
                Text(article.author ?? "Unknown")
                    .dateStyle()
                Text(article.publishedAt.customFormatted)
                    .dateStyle()
                Spacer()
            }
            Spacer()
            VStack {
                Text(article.articleDescription)
                    .subtitleStyle()
            }
            Spacer()
            Spacer()
        }.padding(.horizontal, 30)
    }
}

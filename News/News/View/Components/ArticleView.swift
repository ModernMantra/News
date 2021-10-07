//
//  ArticleView.swift
//  News
//
//  Created by Kerim Njuhovic on 7. 10. 2021..
//

import SwiftUI
import Kingfisher

struct ArticleView: View {
    
    @State var article: Article
    
    var body: some View {
        VStack (alignment: .leading, spacing: Constants.spacing) {
            HStack(alignment: .top, spacing: Constants.spacing) {
                if
                    let urlToImage = article.urlToImage,
                    let url = URL(string: urlToImage)
                {
                    KFImage(url)
                        .frame(width: Constants.imageFrame.width, height: Constants.imageFrame.height)
                        .background(Color(UIColor.systemFill))
                        .cornerRadius(Constants.cornerRadius)
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                } else {
                    Image(systemName: "photo.fill")
                        .foregroundColor(.black)
                        .frame(width: Constants.imageFrame.width, height: Constants.imageFrame.height)
                }
                
                VStack (alignment: .leading, spacing: Constants.spacing) {
                    Text(article.title)
                        .titleStyle()
                    Text(article.publishedAt.customFormatted)
                        .dateStyle()
                }
            }
        }
        .padding(.vertical, 12)
    }
}

//
//  Homepage.swift
//  News
//
//  Created by Kerim Njuhovic on 7. 10. 2021..
//

import SwiftUI

struct Homepage: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    @State private var showingAlert = false
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
                
            case .error(let error):
                VStack {
                    Spacer()
                    Text(error.localizedDescription)
                    Button("Retry") {
                        viewModel.getArticles()
                    }
                    Spacer()
                }
                
            case .completed(let articles):
                NavigationView {
                    List(articles) { article in
                        NavigationLink(destination: ArticleDetailsView(article: article)) {
                            ArticleView(article: article)
                        }
                    }.navigationTitle(Text("Headlines"))
                }
                
            case .none:
                EmptyView()
            }
        }.onAppear(perform: {
            viewModel.getArticles()
        })
    }
}

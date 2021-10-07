//
//  HomeViewModel.swift
//  News
//
//  Created by Kerim Njuhovic on 7. 10. 2021..
//

import Foundation
import Combine

// MARK: - Data loading state -

enum DataLoadingState {
    
    case none
    case loading
    case completed(articles: [Article])
    case error(Error)
    
}

// MARK: - View Model -

class HomeViewModel: ObservableObject {
    
    @Published private(set) var state: DataLoadingState = .none
    
    private(set) var articles = [Article]()
    private(set) var cancellables = Set<AnyCancellable>()
    
    func getArticles() {
        state = .loading
        
        let cancellable = NetworkService.getArticles().sink { result in
            switch result {
            case .failure(let error):
                self.state = .error(error)
                
            case .finished:
                self.state = .completed(articles: self.articles)
            }
        } receiveValue: { response in
            self.articles = response.articles
        }
        
        self.cancellables.insert(cancellable)
    }
}

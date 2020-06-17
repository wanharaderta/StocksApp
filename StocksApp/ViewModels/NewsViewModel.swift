//
//  NewsViewModel.swift
//  StocksApp
//
//  Created by Wanhar on 17/06/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import Foundation

struct NewsViewModel {
    
    let article : Article

    var title: String {
        return self.article.title
    }

    var imageURL: String {
        return self.article.imageURL
    }

    var publication: String {
        return self.article.publication
    }

}

//
//  NewsView.swift
//  StocksApp
//
//  Created by Wanhar on 17/06/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import SwiftUI
import URLImage

struct NewsView: View {
    
    let viewModel   : [NewsViewModel]
    let onDragBegin : (DragGesture.Value) -> Void
    let onDragEnd   : (DragGesture.Value) -> Void
    
    var body: some View {
        
        let screenSize  = UIScreen.main.bounds.size
        
        return VStack(alignment:.leading) {
            HStack {
                VStack(alignment:.leading) {
                    Text("Top News")
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(2)
                        .gesture(DragGesture()
                            .onChanged(self.onDragBegin)
                            .onEnded(self.onDragEnd))
                    
                    Text("News")
                        .foregroundColor(Color.gray)
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(2)
                }
                Spacer()
            }.padding().contentShape(Rectangle())
                .gesture(DragGesture()
                    .onChanged(self.onDragBegin)
                    .onEnded(self.onDragEnd))
            
            ScrollView {
                VStack {
                    ForEach(self.viewModel, id: \.title) { news in
                        HStack {
                            VStack(alignment:.leading) {
                                Text(news.publication)
                                    .foregroundColor(Color.white)
                                    .font(.custom("Arial", size: 22))
                                    .fontWeight(.bold)
                                
                                Text(news.title)
                                    .foregroundColor(Color.gray)
                                    .font(.custom("Arial", size: 20))
                            }
                            Spacer()
                            
                            URLImage(URL(string: news.imageURL)!,
                                     content: {
                                        $0.image.resizable()
                            }).frame(width: 100, height: 100)
                        }
                    }
                }.frame(maxWidth: .infinity)
            }
        }.frame(width: screenSize.width, height: screenSize.height)
        .background(Color(red: 27/255, green: 28/255, blue: 30/255))
        .cornerRadius(20)
    }
}

#if DEBUG
struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        
        let article = Article(title: "News", imageURL: "https://i.ytimg.com/vi/gtkiRJwSN10/maxresdefault.jpg", publication: "Reporter")
        
        return NewsView(viewModel: [NewsViewModel(article: article)], onDragBegin: {_ in}, onDragEnd: {_ in})
    }
}
#endif


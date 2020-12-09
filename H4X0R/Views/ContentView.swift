//
//  ContentView.swift
//  H4X0R
//
//  Created by Eric Walter on 23.11.20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManger = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManger.posts) { post in
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    })
                
            }
            .navigationTitle("Hacker News")
        }
        .onAppear(perform: {
            self.networkManger.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Bonjour"),
//    Post(id: "3", title: "Halo")
//]

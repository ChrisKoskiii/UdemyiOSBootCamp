//
//  ContentView.swift
//  H4X0R News
//
//  Created by Christopher Koski on 3/5/22.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject var networkManager = NetworkManager()
  
  
  var body: some View {
    NavigationView {
      List(networkManager.posts) { post in
        NavigationLink(destination: DetailView(url: post.url)) {
          HStack {
            Text(String(post.points))
            Text(post.title)
          }
        }
      }
      .navigationTitle("H4X0R News")
    }
    .onAppear {
      self.networkManager.fetchData()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

//let posts = [
//  Post(id: "1", title: "Hello"),
//  Post(id: "2", title: "Goodbye"),
//  Post(id: "3", title: "Whats up")
//]

//
//  ContentView.swift
//  AppleRepos
//
//  Created by Patrik Seben on 04/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State var posts: [Post] = []
    var body: some View {
        List(posts) { post in
            Text(post.full_name)
                
        }.onAppear {
            Api().getPosts { (posts) in
                self.posts = posts
            }
    }
            }
                
        }
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

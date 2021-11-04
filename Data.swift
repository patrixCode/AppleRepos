//
//  Data.swift
//  AppleRepos
//
//  Created by Patrik Seben on 04/11/2021.
//

import SwiftUI

struct Post: Codable, Identifiable {
    let id = UUID()
    
    var full_name: String
    var description: String?
  
}

class Api {
    func getPosts(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://api.github.com/users/apple/repos") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
            
        }
        .resume()
    }
}

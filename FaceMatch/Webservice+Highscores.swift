//
//  Webservice+Highscores.swift
//  FaceMatch
//
//  Created by Kelvin Lau on 2017-06-25.
//  Copyright © 2017 Kelvin Lau. All rights reserved.
//

import Foundation

extension Webservice: HighscoresAPI {
  /*
   Expected response json:
   
   { 
     "scores": [
       { "name": "Kelvin Lau", "score": 30 },
       { "name": "Novjek", "score": 25 }
       // ...more
     ]
   }
  */
  func getHighscores(completion: @escaping ([Score]) -> ()) {
    
    // TODO: - add endpoint for highscores
    let url = URL(string: "")!
  
    URLSession.shared.dataTask(with: url) { data, _, _ in
      var scoresArray: [Score] = []
      defer {
        DispatchQueue.main.async {
          completion(scoresArray)
        }
      }
      
      let dict = self.response(from: data)
      guard let scoresDictionaries = dict["scores"] as? [[String: Any]] else { return }
      scoresArray = scoresDictionaries.map(Score.init)
    }.resume()
  }
}

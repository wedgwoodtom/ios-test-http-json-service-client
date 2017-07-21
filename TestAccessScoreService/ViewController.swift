//
//  ViewController.swift
//  TestAccessScoreService
//
//  Created by Tom Patterson on 7/20/17.
//  Copyright © 2017 Tom Patterson. All rights reserved.
//

import UIKit

import Alamofire
import Foundation
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let scoreClient = ScoreClient()
        //scoreClient.getHighscores(userId: "playerId1", gameId: "gameId1", scoresCallback: scoresReturned)
//        scoreClient.submitScore(userId: "playerId1", gameId: "gameId1", score:50000, scoresCallback: scoresReturned)

        
        let SERVICE_URL = "https://tph3djc4zl.execute-api.us-west-2.amazonaws.com/test/highscores"
        
        let parameters: Parameters = [
            "userId": "playerId1",
            "gameId": "gameId1"
        ]
        
        Alamofire.request(SERVICE_URL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            debugPrint(response)
        
            let json = JSON(response.data!)
            let scores = json["highScores"].array
            for score in scores! {
                print(score["userId"])
            }

        }

    }

    func scoresReturned(scores: [Score]) {
        for score in scores {
            print("Player: \(score.id) has score \(score.score)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}


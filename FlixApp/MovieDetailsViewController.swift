//
//  MovieDetailsViewController.swift
//  FlixApp
//
//  Created by Daniel Sanchez on 9/15/20.
//  Copyright © 2020 Daniel Sanchez. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var backDropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    @IBOutlet weak var starColor: UIImageView!
    @IBOutlet weak var titleShadow: UIView!
    
    var movie: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = movie["title"] as? String
        synopsisLabel.text = movie["overview"] as? String
        
        synopsisLabel.sizeToFit()

        let pulledDate = movie["release_date"]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let releasedDate = dateFormatter.date(from: pulledDate as! String)
        
        dateFormatter.dateFormat = "MMMM d, yyyy"
        releasedLabel.text = dateFormatter.string(from: releasedDate!)
        let ratingAverage = movie["vote_average"] as! Double
        ratingLabel.text = String(ratingAverage)
        voteCountLabel.text = String(movie["vote_count"] as! Int)
        
        if(ratingAverage >= 7.9) {
            starColor.image = #imageLiteral(resourceName: "bullish")
        } else if (ratingAverage <= 7.899 && ratingAverage >= 5.99) {
            starColor.image = #imageLiteral(resourceName: "neutral_trading")
        } else {
            starColor.image = #imageLiteral(resourceName: "bearish")
        }
        
        let baseUrl = "https://image.tmdb.org/t/p/"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + "w185" + posterPath)!
        let backDropPath = movie["backdrop_path"] as! String
        let backDropUrl = URL(string: baseUrl + "w780" + backDropPath)!
        
        posterView.af_setImage(withURL: posterUrl)
        backDropView.af_setImage(withURL: backDropUrl)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

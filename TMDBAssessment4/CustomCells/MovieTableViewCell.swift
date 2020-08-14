//
//  MovieTableViewCell.swift
//  TMDBAssessment4
//
//  Created by Colton Swapp on 8/14/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var imagePosterView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    
    
    // MARK: - Properties
    
    var delegate: MovieTableViewController?
    
    var movie: CBSMovie? {
        didSet {
            guard let movie = movie else { return }
            fetchMovieAndUpdateUI(for: movie)
        }
    }
    
    
    // MARK: - Methods
    
    func fetchMovieAndUpdateUI(for movie: CBSMovie) {
        let movie = movie
        DispatchQueue.main.async {
            self.movieTitleLabel.text = movie.title
            self.movieRatingLabel.text = "Average rating: \(movie.rating)"
            self.movieOverviewLabel.text = "Overview: \(movie.overview)"
            //self.fetchImage(for: movie)
        }
        
    }
    
    func fetchImage(for movie: CBSMovie) {
        
        CBSMovieController.fetchPoster(movie) { (image) in
            DispatchQueue.main.async {
                
                if movie.imageURL == "null" {
                    self.imagePosterView.image = UIImage (named: "posterNotAvail")
                } else {
                    self.imagePosterView.image = image
                }
            }
        }
    }
}

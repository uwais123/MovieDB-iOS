//
//  FavoriteCell.swift
//  MuviApp-IOS
//
//  Created by Uwais Alqadri on 03/05/21.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    private let movieImage = configure(UIImageView()) {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.image = UIImage(named: "Poster")
    }
    
    private let movieTitle = configure(UILabel()) {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18)
    }
    
    private let movieYear = configure(UILabel()) {
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 18)
    }
    
    private let movieDesc = configure(UILabel()) {
        $0.textColor = .darkGray
        $0.numberOfLines = 3
        $0.font = .systemFont(ofSize: 16)
    }
    
    private let favoriteButton = configure(UIButton()) {
        $0.setImage(UIImage(named: "heart-circle"), for: .normal)
    }
    
    func set(movie: Movie) {
        movieTitle.text = movie.title
        movieYear.text = movie.release_date
        movieDesc.text = movie.overview
        movieImage.sd_setImage(with: URL(string: "\(Constants.urlImage)\(movie.backdrop_path ?? "/oBgWY00bEFeZ9N25wWVyuQddbAo.jpg")"))
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [movieImage, movieTitle, movieYear, movieDesc, favoriteButton].forEach { addSubview($0) }
        
        backgroundColor = UIColor(named: "BackgroundColor")
        
        movieImage.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 15, left: 20, bottom: 15, right: 20),size: .init(width: 159, height: 89))
        
        movieTitle.anchor(top: topAnchor, leading: movieImage.trailingAnchor, bottom: nil, trailing: favoriteButton.leadingAnchor, padding: .init(top: 15, left: 8, bottom: 0, right: 5))

        movieYear.anchor(top: movieTitle.bottomAnchor, leading: movieImage.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8))

        movieDesc.anchor(top: movieYear.bottomAnchor, leading: movieImage.trailingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 5, left: 8, bottom: 15, right: 8))
        
        favoriteButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 15, left: 0, bottom: 0, right: 10), size: .init(width: 24, height: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

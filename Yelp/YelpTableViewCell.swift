//
//  YelpTableViewCell.swift
//  Yelp
//
//  Created by jacky nguyen on 3/18/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class YelpTableViewCell: UITableViewCell {

    @IBOutlet weak var ThumbnailImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ratingImage: UIImageView!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var reviewLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ThumbnailImageView.layer.cornerRadius = 3
        ThumbnailImageView.clipsToBounds = true
    }
    
    var business:Business! {
        didSet {
            nameLabel.text = business.name
            addressLabel.text = business.address
            ThumbnailImageView.setImageWithURL(business.imageURL!)
            categoryLabel.text = business.categories!
            distanceLabel.text = business.distance!
            ratingImage.setImageWithURL(business.ratingImageURL!)
            reviewLabel.text = String(business.reviewCount!) + " views"
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  FeedCell.swift
//  Reddit
//
//  Created by Igor Karyi on 08.11.2019.
//  Copyright © 2019 IK. All rights reserved.
//

import UIKit
import SDWebImage

class FeedCell: UITableViewCell {

    @IBOutlet fileprivate weak var iconImage: UIImageView!
    @IBOutlet fileprivate weak var authorLabel: UILabel!
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var dateLabel: UILabel!
    @IBOutlet fileprivate weak var countCommentsLabel: UILabel!

    func setModel(_ model: Children) {
        guard let data = model.data else { return }
        
        iconImage.sd_setImage(
            with: URL(string: data.thumbnail ?? ""),
            placeholderImage: UIImage(named: "")
        )
        
        authorLabel.text = "\(NSLocalizedString("Author:", comment: "")) \(data.author ?? "")"
        titleLabel.text = data.title
        dateLabel.text = data.created?.timeAgoSinceDate()
        countCommentsLabel.text = "\(data.numComments ?? 0) \(NSLocalizedString("comments", comment: ""))"
    }
    
}

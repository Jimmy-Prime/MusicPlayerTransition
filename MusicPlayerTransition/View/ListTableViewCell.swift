//
//  ListTableViewCell.swift
//  MusicPlayerTransition
//
//  Created by Jimmy Lee on 2018/7/11.
//  Copyright © 2018 Prime. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    
    class func identifier() -> String {
        return String(describing: self)
    }

    class func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        selectedBackgroundView = UIView()
    }
}

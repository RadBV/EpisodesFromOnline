//
//  EpisodesTableViewCell.swift
//  unit3-proj2
//
//  Created by Radharani Ribas-Valongo on 10/10/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import UIKit

class EpisodesTableViewCell: UITableViewCell {
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpCell(episodes: Episodes) {
        seasonLabel.text = "S: \(episodes.season), Ep: \(episodes.number)"
        episodeName.text = episodes.name
        if let image = episodes.image?.medium {
            ImageHelper.shared.getImage(urlStr: image) { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let imageFromOnline):
                        self.episodeImage.image = imageFromOnline
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        } else {
            episodeImage.image = UIImage(named: "noimage")
        }
    }
}

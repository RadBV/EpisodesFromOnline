//
//  EpisodeDetailVC.swift
//  unit3-proj2
//
//  Created by Radharani Ribas-Valongo on 10/10/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import UIKit

class EpisodeDetailVC: UIViewController {

    
    //MARK: -- Outlets
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var summary: UITextView!
    
    //MARK: -- Properties
    var episode: Episodes!
    
    //MARK: -- Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    

    private func setUpView() {
        nameLabel.text = episode.name
        seasonLabel.text = "Season: \(episode.season)"
        episodeLabel.text = "Ep: \(episode.number)"
        summary.text = episode.fixedSummary
        if let image = self.episode.image?.original {
                ImageHelper.shared.getImage(urlStr: image) { (result) in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let imageFromOnline):
                            self.imageLabel.image = imageFromOnline
                        case .failure(let error):
                            print(error)
                        }
                    }
                }
        } else {
            imageLabel.image = #imageLiteral(resourceName: "placeholder")
        }
    }
}

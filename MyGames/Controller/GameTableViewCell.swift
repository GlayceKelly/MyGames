//
//  GameTableViewCell.swift
//  MyGames
//
//  Created by Glayce on 07/04/20.
//  Copyright © 2020 Glayce. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    //Controles da view
    @IBOutlet weak var ivCover: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbConsole: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with game: Games) {
        lbTitle.text = game.title ?? ""
        lbConsole.text = game.console?.name ?? ""
        
        if let image = game.cover as? UIImage {
            ivCover.image = image
        } else {
            ivCover.image = UIImage(named: "noCover")
        }
    }
}

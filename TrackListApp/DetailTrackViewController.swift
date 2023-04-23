//
//  DetailTrackViewController.swift
//  TrackListApp
//
//  Created by Zaki on 23.04.2023.
//

import UIKit

class DetailTrackViewController: UIViewController {

    @IBOutlet var songImage: UIImageView!
    @IBOutlet var titleImageLabel: UILabel!
    
    var track: Track!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        songImage.image = UIImage(named: track.title)
        titleImageLabel.text = track.title
    }
    



}

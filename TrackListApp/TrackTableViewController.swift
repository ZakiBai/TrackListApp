//
//  TrackTableViewController.swift
//  TrackListApp
//
//  Created by Zaki on 23.04.2023.
//

import UIKit

final class TrackTableViewController: UITableViewController {
    
    private var tracks = Track.getTrack()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        navigationItem.leftBarButtonItem = editButtonItem
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tracks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let track = tracks[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = track.song
        content.secondaryText = track.artist
        content.image = UIImage(named: track.title)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var track = tracks.remove(at: sourceIndexPath.row)
        tracks.insert(track, at: destinationIndexPath.row)
    }
    
//MARK: - Segue Prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let detailVC  = segue.destination as? DetailTrackViewController else { return }
            detailVC.track = sender as? Track
        }
        
//MARK: - Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let track = tracks[indexPath.row]
        performSegue(withIdentifier: "info", sender: track)
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    
}

   



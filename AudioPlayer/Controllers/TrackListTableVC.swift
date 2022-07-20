//
//  TrackListTableVC.swift
//  AudioPlayer
//
//  Created by Дмитрий Соколовский on 18.07.22.
//

import Foundation
import UIKit

class TrackListTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource  {
  
    

    @IBOutlet weak var table: UITableView!
    var songs = [Song]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }

    func configureSongs() {
        songs.append(Song(name: "MMM",
                          albumName: "Unknow",
                          artistName: "Minelli",
                          imageName: "cover1",
                          trackName: "song1"))
        songs.append(Song(name: "Paradise",
                          albumName: "Paradise",
                          artistName: "Ofenbach ft. Benjamin Ingrosso",
                          imageName: "45107035",
                          trackName: "ofenbach_benjamin_ingrosso_paradise"))
        songs.append(Song(name: "Shape Of You",
                          albumName: "Shape Of You",
                          artistName: "Ed Sheeran",
                          imageName: "33120681",
                          trackName: "ed_sheeran_shape_of_you"))
        songs.append(Song(name: "Небо поможет нам",
                          albumName: "Животный мир",
                          artistName: "Макс Корж",
                          imageName: "28275484",
                          trackName: "Maks_korzh_nebo_pomozhet_nam"))
        songs.append(Song(name: "Background music",
                          albumName: "123 Other",
                          artistName: "Rnado",
                          imageName: "cover4",
                          trackName: "song4"))
        songs.append(Song(name: "Havana",
                          albumName: "Havana album",
                          artistName: "Camilla Cabello",
                          imageName: "cover2",
                          trackName: "song2"))
        songs.append(Song(name: "Пламенный свет",
                          albumName: "Пламенный свет",
                          artistName: "Макс Корж",
                          imageName: "21878230",
                          trackName: "song6"))
        songs.append(Song(name: "Supergirl (feat. Alle Farben, Younotus)",
                          albumName: "Single Charts",
                          artistName: "Anna Naklab",
                          imageName: "25744444",
                          trackName: "song5"))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "PlayerVC") as? PlayerViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }
}


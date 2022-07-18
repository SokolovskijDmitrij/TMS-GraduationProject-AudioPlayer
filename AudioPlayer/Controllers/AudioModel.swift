//
//  AudioModel.swift
//  AudioPlayer
//
//  Created by Дмитрий Соколовский on 18.07.22.
//
import UIKit

struct Audio: Equatable {
    
    var url = ""
    var title = "Unknown"
    var artist = "Unknown"
    var duration = 0
    var thumbnail_image: UIImage?
    var id = 0
    
    init(withThumbnailImage timage: UIImage?, url: String, title: String, artist: String , duration: Int) {
        self.thumbnail_image = timage
        self.url = url
        self.title = title.stripped
        self.artist = artist.stripped
        self.duration = duration
    }
    
    //Used for Core Data loading Image
    init(withID id: Int, url: String, title: String, artist: String , duration: Int, t_img: UIImage?) {
        self.id = id
        self.url = url
        self.title = title.stripped
        self.artist = artist.stripped
        self.duration = duration
        self.thumbnail_image = t_img
    }
    
}


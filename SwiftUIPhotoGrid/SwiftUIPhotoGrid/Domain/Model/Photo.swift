//
//  Photo.swift
//  SwiftUIPhotoGrid
//
//  Created by Marble Interactive SL on 11/2/23.
//

import Foundation

struct Photo: Identifiable {
    var id = UUID()
    var name: String
}

let samplesPhotos = (1...20).map{ Photo(name: "Coffee-\($0)")}

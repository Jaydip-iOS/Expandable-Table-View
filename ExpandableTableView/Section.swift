//
//  Section.swift
//  ExpandableTableView
//
//  Created by PC on 08/08/18.
//  Copyright © 2018 Jaydip Finava. All rights reserved.
//

import UIKit

struct Section {
    var genre: String!
    var movies: [String]!
    var expanded: Bool!
    init(genre: String, movies: [String], expanded: Bool) {
        self.genre = genre
        self.movies = movies
        self.expanded = expanded
    }
}

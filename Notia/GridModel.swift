//
//  GridModel.swift
//  Notia
//
//  Created by Inyene Etoedia on 12/01/2023.
//

import SwiftUI

struct GridModel: Identifiable, Hashable {
    var id = UUID().uuidString
    var text : String
    var subtext : String
    var image : String
    var height : CGFloat
}


var ImageList : [GridModel] = [

    GridModel(text: "Sprint Planning for the week", subtext: "created 5mins ago",image: "img1", height: 200),
    GridModel(text: "Sprint Planning for the month", subtext: "created 5mins ago", image: "img2", height: 250),
    GridModel(text: "Sprint Planning for the year", subtext: "created 5mins ago", image: "img3", height: 280),
    GridModel(text: "Sprint Planning for 3 months",subtext: "created 5mins ago", image: "img4", height: 230),
    GridModel(text: "Sprint Planning for 11 days", subtext: "created 5mins ago", image: "img5", height: 260),
    GridModel(text: "Sprint Planning for 2 weeks", subtext: "created 5mins ago", image: "img5", height: 220),


]

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
    GridModel(text: "Note2 !", subtext: "created 5mins ago", image: "img2", height: 250),
    GridModel(text: "Note3 !", subtext: "created 5mins ago", image: "img3", height: 280),
    GridModel(text: "Note4 !",subtext: "created 5mins ago", image: "img4", height: 230),
    GridModel(text: "Note5 !", subtext: "created 5mins ago", image: "img5", height: 260),
    GridModel(text: "Note6 !", subtext: "created 5mins ago", image: "img5", height: 220),


]

//
//  StaggeredGrid.swift
//  Notia
//
//  Created by Inyene Etoedia on 12/01/2023.
//

import SwiftUI

struct StaggeredGrid <Content: View,T: Identifiable>: View where T: Hashable {
    var content : (T) -> Content
    var list : [T]
    
    var showIndicators : Bool
    var spacing : CGFloat
    var columns : Int
    
    init(columns: Int, showIndicators : Bool = false, spacing : CGFloat = 10, list: [T], @ViewBuilder content: @escaping (T) -> Content) {
        self.content = content
        self.list = list
        self.showIndicators = showIndicators
        self.spacing = spacing
        self.columns = columns
    }
     
    
    func setUpList()->[[T]]{
        var gridArray : [[T]] = Array(repeating: [], count: columns)
        
        var currentItem : Int = 0
        
        for object in list {
            gridArray[currentItem].append(object)
            
            if currentItem == (columns - 1){
                currentItem = 0
            } else{
                currentItem += 1
            }
        }
        
        return gridArray
    }
    
    
    var body: some View {
        
        
        ScrollView(.vertical ,showsIndicators: showIndicators) {
            HStack(alignment: .top){
                ForEach(setUpList(), id: \.self) { columnData in
                    LazyVStack( spacing: spacing) {
                        ForEach(columnData) { object in
                          content(object)
                            
                            
                        }
                    }
                }
            }
        }
        

    }
}

//struct StaggeredGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        StaggeredGrid()
//    }
//}

//
//  sample_app.swift
//  Notia
//
//  Created by Inyene Etoedia on 12/01/2023.
//

import SwiftUI

struct sample_app: View {
    @State var gridModel : [GridModel] = []
    
    
    var body: some View {

     
        ZStack (alignment:.bottom){
            VStack(alignment:.leading){
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
//               Spacer()
                }
           
                .frame(width: UIScreen.main.bounds.width,
                       height:300, alignment: .top)
                .background {
                    Rectangle()
                        .foregroundColor(.black)
//                        .frame(width: UIScreen.main.bounds.width,
//                               height:500, alignment: .bottomLeading
//                        )
                        .cornerRadius(100)
                       
                }
                .offset(y: 300)
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
//        StaggeredGrid(columns: 2, list: ImageList, content: { index in
//            GridView(gridImage: index)
//        } )
    }
}

struct sample_app_Previews: PreviewProvider {
    static var previews: some View {
        sample_app()
    }
}


struct GridView : View {
    var gridImage : GridModel
    var body: some View{
        Image(gridImage.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .cornerRadius(10)
        
        
    }
    
}

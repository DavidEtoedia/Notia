//
//  ContentView.swift
//  Notia
//
//  Created by Inyene Etoedia on 07/01/2023.
//

import SwiftUI

struct ContentView: View {
    @Namespace var nameSpace
    @State private var height: CGFloat = 100
    @State private var isShow: Bool = false
    @State private var isLogo: Bool = false
    @State private var isDone: Bool = false
    @State private var isGrid: Bool = false
    @State private var isTapped: Bool = false
    @State private var itemTapped: Bool = false
    @State private var isNote: Bool = false
    @State private var screenH: CGFloat =  UIScreen.main.bounds.height
    @State private var screenW: CGFloat =  UIScreen.main.bounds.width
    var column: [GridItem] = [
        GridItem(.fixed(50), spacing: 150),
        GridItem(.fixed(50), spacing: 150),
//        GridItem(.fixed(20), spacing: 100),
//        GridItem(.fixed(20), spacing: 100),
    ]
    var body: some View {
        
        ZStack (alignment: .bottom){
            VStack {
                Spacer(minLength: isShow ? .zero :  screenH / 0.5  )
                ZStack{
                
                    if isDone{
                        VStack{
                            StaggeredGrid(columns: 2, list: ImageList, content: { item in
                                ZStack{
                                    Rectangle()
                                    .foregroundColor(.gray.opacity(0.2))
                                    .cornerRadius(10)
                                    .frame(width: 190, height: item.height)
                                    VStack(alignment: .leading){
                                        Image(systemName: "heart")
                                            .resizable()
                                            .frame(width: 20, height: 18)
                                            .foregroundColor(.gray)
    //                                    .padding(.leading, 100)
    //                                    .padding(.vertical)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                        VStack(alignment: .leading) {
                                            Image(systemName: "doc.text")
                                                .resizable()
                                                .frame(width: 20, height: 25)
                                            .foregroundColor(.white)
    //                                        .padding(.vertical)
    //                                        .frame(maxWidth: .infinity)
                                            
                                            Text(item.text)    .font(.custom("RobotoMono-Medium", size: 17))
                                                .foregroundColor(.white)
                                            Spacer()
                                            Text(item.subtext)    .font(.custom("RobotoMono-Medium", size: 12))
                                                .multilineTextAlignment(.leading)
                                                .foregroundColor(.gray.opacity(0.3))
                                            
                                        }
                                        Spacer(minLength: 3)
                                    }
                                    .padding(.horizontal)
                                    .padding(.vertical)
                                }
      
                            })
                            .opacity(isGrid ? 0.98 : 0.0)
                            .offset(y: isGrid ? screenH / 3 : 500)
                            Spacer(minLength: screenH / 6.0)
                        }
                        // MARK:  FLOATING ACTION BUTTON

                
                       
                         
                    }
                    GeometryReader { geometry in
                          Rectangle()
                            .foregroundColor(.indigo)
                            .frame( height: isDone ?  250 : geometry.size.height)
                            .cornerRadius( isDone ? 10 : 0)
                      }
                    Text("My Notes")
                        .font(.custom("RobotoMono-Medium", size: 40))
                        .foregroundColor(.white)
                    .frame(maxWidth:.infinity ,alignment: .leading)
                    .padding(.horizontal, 20)
                    .opacity(isDone ? 0.98 : 0.0)
                    .offset(y: isDone ? -150 : 100)
             ///MARK : APP LOGO
                            HStack {
                                Image(systemName: "shekelsign.square")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(.white)
                               
                                Text("Notia")
                                    .font(.custom("RobotoMono-Medium", size: 40))
                                    .kerning(-3)
                                    .foregroundColor(.white)
                            }
                            .opacity(isDone ? 0 : 0.99)
                            .offset(y: isLogo ? 10 : 70)
                }
    //           .frame(maxHeight: isDone ? 100 : .infinity)
                .onAppear {
                    withAnimation (.spring(response: 0.5, dampingFraction: 0.9 ).delay(0.6)){
                        isShow = true
                    }
                    withAnimation (.spring(response: 0.8, dampingFraction: 0.7 ).delay(0.8)){
                        isLogo = true
                    }
                    withAnimation (.spring(response: 0.7, dampingFraction: 0.7 ).delay(1.8)){
                        isDone = true
                    }
                    withAnimation (.spring(response: 0.7, dampingFraction: 0.7 ).delay(1.75)){
                        isGrid = true
                    }
                }
                .edgesIgnoringSafeArea(.all)
                Spacer(minLength: isDone ? screenH / 7 : 0)
               
            }
            .background(.black)
            .overlay {
                if isTapped {
                   
                    VStack(spacing: 20){
                            Image(systemName: "chevron.left")
                                .resizable()
                                .foregroundColor(.black)
                                .opacity(itemTapped ? 1 : 0)
                                .frame(width: 10, height: 20)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .onTapGesture {
                                    withAnimation (.spring(response: 0.5, dampingFraction: 0.7,
                                                           blendDuration: 0.2
                                                          )){
                                        isTapped = false
                                            isNote = false
                                            itemTapped = false
                                           
                                        
                                    }
                                }
                                .padding(.horizontal, 20)
                            Text("Title")
                                .font(.custom("RobotoMono-Medium", size: 40))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .opacity(itemTapped ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 20)
                            Spacer()
                       
                        }
                        .background {
                            Rectangle()
                              .foregroundColor(itemTapped ? .gray.opacity(1) : .gray.opacity(0.6))
                              .frame(height: screenH )
                              .edgesIgnoringSafeArea(.all)
                        }
                    
                
                }
              
            }
            if isTapped{
                ZStack (alignment: .center){
                    VStack {
                        if itemTapped{
                         
                       
                                VStack (alignment: .leading){
                                    HStack (alignment: .top){ // << moved this up to ZStack
                                               Text("Write something")
                                                   .font(.custom("RobotoMono-Medium", size: 19))
                                                   .fontWeight(.light)
                                                   .foregroundColor(.gray)
                                                   .frame(maxWidth: .infinity, alignment: .leading)
                                                   .padding(.horizontal, 20)
                                                   .padding(.vertical)
                                           }
                                    .offset(y: -500)
                                    HStack (alignment: .center){ // << moved this up to ZStack
                                               Text("Created today")
                                                   .font(.custom("RobotoMono-Medium", size: 15))
                                                   .fontWeight(.light)
                                                   .foregroundColor(.gray)
                                                   .frame(maxWidth: .infinity, alignment: .center)
                                                   .padding(.horizontal, 20)
                                                   .padding(.vertical)
                                           }

                                }
                               
                                   
                            
                         
                        }
                        else{
                            VStack{
                                Text("What would you\nlike to do?")
                                    .font(.custom("RobotoMono-Medium", size: 23))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 50)
                                HStack(spacing: 65) {
                                    HStack(spacing: 20){
                                        Image(systemName: "doc.text")
                                            .resizable()
                                            .frame(width: 15, height: 20)
                                            .foregroundColor(.white)
                                            .background {
                                                Rectangle()
                                                   .frame(width: 35, height: 35)
                                                   .foregroundColor(.purple)
                                                   .cornerRadius(15)
            //                                       .padding(.horizontal)
            //                                       .padding(.vertical)
                                            }
                                       
                                        Text("Create new note")
                                            .font(.custom("RobotoMono-Medium", size: 16))
                                            .foregroundColor(.white)
                                            .padding(.vertical, 22)
                                    }
                                    
                                    Image(systemName: "chevron.forward")
                                        .resizable()
                                        .frame(width: 5, height: 10)
                                        .foregroundColor(.white)
                                }
                                .background {
                                    Rectangle()
                                       .frame(width: screenW / 1.3, height: 65)
                                       .foregroundColor(.gray.opacity(0.3))
                                       .cornerRadius(10)
                                }
                                .onTapGesture {
                                    withAnimation (.spring(response: 0.6, dampingFraction: 0.6)){
                                        itemTapped = true
                                    }
                                }
                                HStack(spacing: 65) {
                                    HStack(spacing: 20){
                                        Image(systemName: "doc.text")
                                            .resizable()
                                            .frame(width: 15, height: 20)
                                            .foregroundColor(.white)
                                            .background {
                                                Rectangle()
                                                   .frame(width: 35, height: 35)
                                                   .foregroundColor(.orange)
                                                   .cornerRadius(15)
            //                                       .padding(.horizontal)
            //                                       .padding(.vertical)
                                            }
                                       
                                        Text("Create new event")
                                            .font(.custom("RobotoMono-Medium", size: 16))
                                            .foregroundColor(.white)
                                            .padding(.vertical, 22)
                                    }
                                    
                                    Image(systemName: "chevron.forward")
                                        .resizable()
                                        .frame(width: 5, height: 10)
                                        .foregroundColor(.white)
                                }
                                .background {
                                    Rectangle()
                                       .frame(width: screenW / 1.3, height: 65)
                                       .foregroundColor(.gray.opacity(0.3))
                                       .cornerRadius(10)
                                }
                                
                                HStack(spacing: 65) {
                                    HStack(spacing: 20){
                                        Image(systemName: "doc.text")
                                            .resizable()
                                            .frame(width: 15, height: 20)
                                            .foregroundColor(.white)
                                            .background {
                                                Rectangle()
                                                   .frame(width: 35, height: 35)
                                                   .foregroundColor(.green)
                                                   .cornerRadius(15)
            //                                       .padding(.horizontal)
            //                                       .padding(.vertical)
                                            }
                                       
                                        Text("Create new list")
                                            .font(.custom("RobotoMono-Medium", size: 16))
                                            .foregroundColor(.white)
                                            .padding(.vertical, 22)
                                    }
                                    
                                    Image(systemName: "chevron.forward")
                                        .resizable()
                                        .frame(width: 5, height: 10)
                                        .foregroundColor(.white)
                                }
                                .background {
                                    Rectangle()
                                       .frame(width: screenW / 1.3, height: 65)
                                       .foregroundColor(.gray.opacity(0.3))
                                       .cornerRadius(10)
                                }
                                
                           
                                Text("Close")
                                    .font(.custom("RobotoMono-Medium", size: 17))
                                    .foregroundColor(.white)
                                    .padding(.vertical, 30)
                                    .onTapGesture {
                                    withAnimation (.spring(response: 0.6, dampingFraction: 0.6)){
                                        isTapped = false
                                    }
                                        withAnimation (.spring(response: 0.6, dampingFraction: 0.6)){
                                            isNote = false
                                        }
                                }
                            }
//                            .opacity(itemTapped ? 0 : 1)
                            .offset(y: isNote ? 5 : 10)
                        }
                       
                        
                      
                    }
                    .offset(y: 10)
                    .background(  RoundedRectangle(cornerRadius: 30 , style: .continuous)
                        .fill(Color.black)
                        .frame(width: itemTapped ? screenW : nil, height: itemTapped ? screenH / 0.75 : screenH / 2)
                        .padding(.horizontal, 20)
                        .matchedGeometryEffect(id: "corner", in: nameSpace)
                     
                    )
                    .mask({
                          RoundedRectangle(cornerRadius: 20 , style: .continuous)
                              .matchedGeometryEffect(id: "corner", in: nameSpace)
                })
                }
                
                .offset(y: itemTapped ? 10 : -20)
            }

            else{
                    HStack(alignment:.bottom) {
                        Spacer()
                        ZStack {
                          
                            Rectangle()
                                .fill(Color.green)
                                .frame(width: 70, height: 70)
                                .mask({
                                RoundedRectangle(cornerRadius: 100 , style: .continuous)
                                    .matchedGeometryEffect(id: "corner", in: nameSpace)})
                                .onTapGesture {
                                 withAnimation (.spring(response: 0.7, dampingFraction: 0.7)){
                                    isTapped = true}
                                withAnimation (.spring(response: 0.7, dampingFraction: 0.7).delay(0.1)){
                                        isNote = true}
                                   
                            }
                            Image(systemName: "plus")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                                .padding(.horizontal)
                                .background(  RoundedRectangle(cornerRadius: 30 , style: .continuous)
                                    .fill(.clear)
//                                    .frame(height: screenH / 2)
                                    .padding(.horizontal, 20)
                                    .matchedGeometryEffect(id: "corner", in: nameSpace)
                                 
                                )
                                .mask({
                                      RoundedRectangle(cornerRadius: 20 , style: .continuous)
                                          .matchedGeometryEffect(id: "corner", in: nameSpace)
                            })
                        }
                    }
                    .opacity(isDone ? 0.98 : 0.0)
                    .padding(.horizontal)
            }
        }
    }
   /* init(){
        for family in UIFont.familyNames {
             print(family)

             for names in UIFont.fontNames(forFamilyName: family){
             print("== \(names)")
             }
        }
    }
    */

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

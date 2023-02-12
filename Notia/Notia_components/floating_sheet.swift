//
//  floating_sheet.swift
//  Notia
//
//  Created by Inyene Etoedia on 11/02/2023.
//

import SwiftUI

struct Floating_Sheet: View {
    @Binding var showSheet: Bool
    @Binding var showButton: Bool
    @Binding var showContent: Bool
    @Binding var selectedItem: Bool
    @Binding var showEditor: Bool
    @State var text: String = ""
    @State var title: String = ""
    @State private var screenH: CGFloat =  UIScreen.main.bounds.height
    @State private var screenW: CGFloat =  UIScreen.main.bounds.width
    var nameSpace: Namespace.ID
    var body: some View {
        ZStack(alignment:.bottom) {
            Color(.gray).opacity(!selectedItem ? 0.6 : 1)
            /// TOP X MARK
            if selectedItem{
                VStack{
                    Spacer()
                       .frame(height: 45)
                    Image(systemName: "xmark")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20)
                    .frame(maxWidth: .infinity,  alignment: .trailing)
                    .padding(.horizontal, 20)
                    .onTapGesture {
                        withAnimation (.interactiveSpring(response: 0.5, dampingFraction: 0.6)){
                            self.selectedItem = false
                            self.showSheet = false
                            self.showButton = true
                            self.showEditor = false
                            
                        }
                    }
                    Spacer()
                       .frame(height: 40)
                    ZStack(alignment: .topLeading){
                       if title.isEmpty{
                           Text("Title")
                               .font(.custom("RobotoMono-Medium", size: 35))
                               .foregroundColor(Color.white)
                               .padding(.horizontal, 20)
                               .frame(maxWidth: .infinity,  alignment: .leading)
                              }
                          
                              TextField("Title", text: $title)
                              .font(.custom("RobotoMono-Medium", size: 35))
                              .foregroundColor(Color.white)
                              .padding(.horizontal, 20)
                              .frame(maxWidth: .infinity,  alignment: .leading)
                          }
      
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }

            VStack {
                Spacer()
                Rectangle()
                    .foregroundColor(.black)
                    .cornerRadius(30)
                    .overlay{
                        
                    VStack{
                      if selectedItem {
                         VStack{
                             ZStack(alignment: .topLeading){
                                if text.isEmpty{
                                    Text("Type here")
                                     .font(.custom("RobotoMono-Medium", size: 20))
                                     .foregroundColor(Color.gray)
                                     .padding(.horizontal, 20)
                                     .padding(.vertical, 15)
                                       }
                                   
                                       TextField("Type here", text: $text,
                                               axis: .vertical)
                                               .frame(height: 200)
                                               .lineLimit(10...)
                                               .multilineTextAlignment(.leading)
                                               .foregroundColor(.white)
                                               .background(Color.clear)
                                               .padding(.horizontal, 20)
                                               .padding(.vertical, 20)
                                   }
                                        
                                        Spacer()
                                    }
                                    .opacity(showEditor ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 20)
                                }
                                else{
                                    Create_feature(showSheet: $showSheet, showButton: $showButton, showContent: $showContent, selectedItem: $selectedItem, showEditor: $showEditor)
                                        .padding(.horizontal, 20)
                                }
                             
                            }
                    }
            }
            .frame(height: selectedItem ?  screenH / 1.25 : screenH / 2.0 )
            .padding(.horizontal, selectedItem ? 0 : 10)
            .padding(.vertical, selectedItem ? 0 : 20)
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct Floating_Sheet_Previews: PreviewProvider {
    @Namespace static var nameSpace
    static var previews: some View {
        Floating_Sheet(showSheet: .constant(true), showButton: .constant(true), showContent: .constant(true),
                       selectedItem: .constant(true), showEditor: .constant(true),
        nameSpace: nameSpace
        )
    }
}

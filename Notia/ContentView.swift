//
//  ContentView.swift
//  Notia
//
//  Created by Inyene Etoedia on 07/01/2023.
//

import SwiftUI

struct ContentView: View {
   @EnvironmentObject var vm: CoreDataViewModel
    @Namespace var nameSpace
    @State private var showSheet: Bool = false
    @State private var showButton: Bool = false
    @State private var showContent: Bool = false
    @State private var selectedItem: Bool = false
    @State private var showEditor: Bool = false
    @State private var isShow: Bool = false
    @State private var text: String = ""
    @State private var title: String = ""
    @State private var isLogo: Bool = false
    @State private var isDone: Bool = false
    @State private var isGrid: Bool = false  
    var body: some View {
        
        let dateformat: DateFormatter = {
               let formatter = DateFormatter()
               formatter.dateStyle = .medium
            formatter.timeStyle = .short
               return formatter
           }()
        ZStack {
            Color(.black)
            VStack{
                Rectangle()
                    .foregroundColor(Color.indigo)
                    .frame(height: !isShow ?  nil :
                            250 , alignment: .topLeading)
                    .cornerRadius(30)
                    .overlay{
                        VStack{
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
                            .opacity(isShow ? 0 : 1)
                            Spacer()
                                .frame(height: 70)
                            Text("My Notes")
                            .font(.custom("RobotoMono-Medium", size: 40))
                            .kerning(-3)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .opacity(isShow ? 1 : 0)
                        }
                    }
                if isGrid {
                    StaggeredGrid(columns: 2, list: vm.todo) { item in
                       
                        VStack {
                              Spacer()
                                 .frame(height:15)
                              Image(systemName: "doc.text")
                               .resizable()
                               .frame(width: 30, height: 35)
                               .foregroundColor(.white)
                               .frame(maxWidth: .infinity, alignment: .leading)
                               .padding(.horizontal)
                               .onTapGesture {
                                   withAnimation (.spring(response: 0.7, dampingFraction: 0.5)){
                                       vm.deleteTodo(obj: item)
                                   }
                                  
                                  
                               }
                                Spacer()
                                 .frame(height:20)

                            Text(item.title ?? "None")
                               .font(.custom("RobotoMono-Medium", size: 20))
                               .foregroundColor(.white)
                               .kerning(-2)
                               .frame(maxWidth: .infinity, alignment: .leading)
                               .padding(.horizontal)
                            
                                 Spacer()
                                  .frame(height: 10)
                            
                            Text(item.message ?? "")
                               .font(.custom("RobotoMono-Medium", size: 13))
                               .foregroundColor(.white)
                               .frame(maxWidth: .infinity, alignment: .leading)
                               .padding(.horizontal)
                              
                            
                            Spacer()
                             .frame(height: 50)
                            Text(dateformat.string(from: item.created ?? Date.now))
                              .font(.custom("RobotoMono-Medium", size: 10))
                              .foregroundColor(.gray.opacity(0.6))
                              .frame(maxWidth: .infinity, alignment: .center)
                              .padding(.horizontal)
                              .padding(.vertical)
                            
                        }
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(30)
                    }
                    .padding(.horizontal, 5)
                    .padding(.bottom, 30)
                }
            }
            .frame(maxHeight: .infinity, alignment: .topLeading)
//            .ignoresSafeArea()
            .onAppear{
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7).delay(0.5)) {
                    isShow = true
                }
                withAnimation (.spring(response: 0.7, dampingFraction: 0.7 ).delay(0.7)){
                    self.isGrid = true
                    self.showButton = true
                }
            }

            /// SHOW SHEET
            if showSheet {
                Floating_Sheet(showSheet: $showSheet, showButton: $showButton, showContent: $showContent, selectedItem: $selectedItem, showEditor: $showEditor
                              )
            }
            /// BUTTONS VIEW
            ///
            if showButton{
                FloatingButton(showSheet: $showSheet, showButton: $showButton, showContent: $showContent, nameSpace: nameSpace)
            }
        }

        .edgesIgnoringSafeArea(.all)
       
       
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
}


struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
}

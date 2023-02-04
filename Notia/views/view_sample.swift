//
//  view_sample.swift
//  Notia
//
//  Created by Inyene Etoedia on 30/01/2023.
//

import SwiftUI

struct view_sample: View {
    @State  var currentTab: Int = 0
    var body: some View {
        VStack(alignment:.center){
            TabBarView(currentTab: self.$currentTab)
//            TabView (selection: self.$currentTab){
//                view1().tag(0)
//                view2().tag(1)
//                view3().tag(2)
//            }
//            .tabViewStyle(.page(indexDisplayMode: .never))
            
           
        }
    }
}

struct TabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    
    var tabBarOptions: [String] = ["Hello World", "This is", "Something cool"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(Array(zip(self.tabBarOptions.indices,
                                  self.tabBarOptions)),
                        id: \.0,
                        content: {
                    index, name in
                    TabBarItem(currentTab: self.$currentTab,
                               namespace: namespace.self,
                               tabBarItemName: name,
                               tab: index)
                    
                })
            }
            .padding(.horizontal)
        }
        .background(Color.white)
        .frame(height: 100)
//        .edgesIgnoringSafeArea(.all)
    }
}



struct TabBarItem: View {
    @Binding var currentTab: Int
    let namespace: Namespace.ID
    
    var tabBarItemName: String
    var tab: Int
    
    var body: some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack {
//                Spacer()
                Text(tabBarItemName)
                    .background{
                                        if currentTab == tab {
                                            Color.black
                                                .frame(height: 80)
                                                .matchedGeometryEffect(id: "underline",
                                                                       in: namespace,
                                                                       properties: .frame)
                                        } else {
                                            Color.clear.frame(height: 80)
                                        }
                    }

            }
            .animation(.spring(), value: self.currentTab)
        }
        .frame(height: 50)
  
        
//        .buttonStyle(.plain)
    }
}



struct view_sample_Previews: PreviewProvider {
    static var previews: some View {
        view_sample()
    }
}

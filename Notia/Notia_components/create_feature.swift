//
//  create_feature.swift
//  Notia
//
//  Created by Inyene Etoedia on 12/02/2023.
//

import SwiftUI

struct Create_feature: View {
    @Binding var showSheet: Bool
    @Binding var showButton: Bool
    @Binding var showContent: Bool
    @Binding var selectedItem: Bool
    @Binding var showEditor: Bool

    var body: some View {
        VStack{
            Spacer()
               .frame(height: 25)
            Text("What would you\nlike to do?")
                .multilineTextAlignment(.leading)
            .font(.custom("RobotoMono-Medium", size: 20))
            .frame( maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.white)
             Spacer()
                .frame(height: 23)
            ForEach(selectCard, id: \.id) { card in
                Rectangle()
                    .foregroundColor(.gray.opacity(0.4))
                    .cornerRadius(12)
                    .frame(height: 70)
                    .overlay {
                        HStack{
                            Image(systemName: "doc.text")
                            .resizable()
                            .frame(width: 15, height: 20)
                            .foregroundColor(.white)
                            .background {
                            Rectangle()
                            .frame(width: 35, height: 35)
                            .foregroundColor(card.text.contains("event") ? .yellow : .green)
                            .cornerRadius(15)
                            }
                            Spacer()
                                .frame(width: 30)
                            Text(card.text)
                            .font(.custom("RobotoMono-Medium", size: 18))
                            .foregroundColor(.white)
            
                            Spacer()
                            Image(systemName: "chevron.forward")
                            .resizable()
                            .frame(width: 6, height: 10)
                            .font(.system(size: 5, weight: .semibold))
                            .foregroundColor(.white)
                          
                        }
                        .padding(.leading, 30)
                        .padding(.trailing, 25)
                    }
                    .onTapGesture {
                        withAnimation (.spring(response: 0.7, dampingFraction: 0.7)){
                            self.selectedItem = true
                            self.showContent = false
                        }
                        withAnimation (.spring(response: 0.7, dampingFraction: 0.7).delay(0.2)){
                            self.showEditor = true
                         
                        }
                    }
            }
            Spacer()
               .frame(height: 23)
            Text("Close")
            .font(.custom("RobotoMono-Medium", size: 21))
            .foregroundColor(Color.white)
            .onTapGesture {
                withAnimation (.interactiveSpring(response: 0.5, dampingFraction: 0.6)){
                    self.showSheet = false
                    self.showButton = true
                    self.showContent = false
                }
            }
            Spacer()
               .frame(height: 20)
        }
    }
}

struct Create_feature_Previews: PreviewProvider {
    static var previews: some View {
        Create_feature(showSheet: .constant(true), showButton: .constant(true), showContent: .constant(true), selectedItem: .constant(true), showEditor: .constant(true))
    }
}

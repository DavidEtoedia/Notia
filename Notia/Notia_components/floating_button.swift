//
//  overlay_sheet.swift
//  Notia
//
//  Created by Inyene Etoedia on 11/02/2023.
//

import SwiftUI

struct FloatingButton: View {
    @Binding var showSheet : Bool
    @Binding var showButton: Bool
    @Binding var showContent: Bool
    var nameSpace: Namespace.ID
    var body: some View {
        VStack{
//            Spacer()
            Image(systemName: "plus")
            .resizable()
            .foregroundColor(.white)
            .frame(width: 20, height: 20)
            .padding(.horizontal)
            .background(  RoundedRectangle(cornerRadius: 30 , style: .continuous)
                .fill(.green)
                .frame(width: 60, height: 60)
                .matchedGeometryEffect(id: "corner", in: nameSpace)
            )
            .mask({
            RoundedRectangle(cornerRadius: 30 , style: .continuous)
                    .fill(.green)
                    .frame(width: 60, height: 60)
            .matchedGeometryEffect(id: "corner", in: nameSpace)
            })
        }

        .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .bottomTrailing)

        .padding(.horizontal, 15)
        .padding(.bottom, 46)
        .opacity(showButton ? 1 : 0)
        .onTapGesture {
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7)) {
                self.showSheet = true
                self.showButton = false
            }
            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.7).delay(0.2)) {
                self.showContent = true
                
            }
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    @Namespace static var nameSpace
    static var previews: some View {
        FloatingButton(showSheet: .constant(true), showButton: .constant(true), showContent:.constant(true), nameSpace: nameSpace)
    }
}

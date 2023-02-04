//
//  view1.swift
//  Notia
//
//  Created by Inyene Etoedia on 30/01/2023.
//

import SwiftUI

struct view1: View {
    var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.green)
    }
}

struct view1_Previews: PreviewProvider {
    static var previews: some View {
        view1()
    }
}

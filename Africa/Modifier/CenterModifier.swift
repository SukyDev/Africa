//
//  CenterModifier.swift
//  Africa
//
//  Created by Vladimir Sukanica on 9.2.21..
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}

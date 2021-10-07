//
//  Text+Styles.swift
//  News
//
//  Created by Kerim Njuhovic on 7. 10. 2021..
//

import SwiftUI

extension Text {
    
    func titleStyle() -> some View {
        self.font(.custom("Jost-Bold", size: 15)).fontWeight(.bold)
    }
    
    func subtitleStyle() -> some View {
        self.font(.custom("Jost-Medium", size: 12)).fontWeight(.light)
    }
    
    func dateStyle() -> some View {
        self.font(.custom("Jost", size: 10))
            .lineLimit(1)
            .foregroundColor(.secondary)
    }
    
}

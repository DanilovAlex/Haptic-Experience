//
//  RoundedButton.swift
//  Haptic-Experience
//
//  Created by Alexander on 23.05.2020.
//  Copyright © 2020 Alexander Danilov. All rights reserved.
//

import SwiftUI

struct RoundedButton: View {
    var action: () -> Void
    var title: String
    var color = Color.gray
    var cornerRadius: CGFloat = 10.0
    
    var body: some View {
        Button(action: self.action) {
            Text(title)
                .font(.headline)
                .padding()
                .background(color)
                .foregroundColor(.primary)
                .cornerRadius(cornerRadius)
        }.buttonStyle(PlainButtonStyle())
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RoundedButton(action: {}, title: "Default")
            RoundedButton(action: {}, title: "With Color", color: .green)
            RoundedButton(action: {}, title: "With Color and Corner Radius", color: .red, cornerRadius: 15)
        }.previewLayout(.sizeThatFits)
    }
}

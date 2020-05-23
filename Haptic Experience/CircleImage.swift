//
//  CircleImage.swift
//  Haptic Experience
//
//  Created by Alexander on 23.05.2020.
//  Copyright © 2020 Alexander Danilov. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4.0))
            .shadow(radius: 10.0)
    }
    
    let imageName: String
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(imageName: "iOS13")
    }
}

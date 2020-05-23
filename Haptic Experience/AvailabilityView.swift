//
//  AvailabilityView.swift
//  Haptic Experience
//
//  Created by Alexander on 23.05.2020.
//  Copyright © 2020 Alexander Danilov. All rights reserved.
//

import SwiftUI

enum OSVersion: String {
    case iOS10
    case iOS13
}

struct AvailabilityView: View {
    var body: some View {
        HStack(spacing: 12.0) {
            Text(version.rawValue.prefix(3))
                .bold()
            CircleImage(imageName: version.rawValue)
                .frame(width: 40, height: 40, alignment: .center)
            Text("+")
                .font(.headline)
                .bold()
        }
    }
    
    let version: OSVersion
}

struct AvailabilityView_Previews: PreviewProvider {
    static var previews: some View {
        AvailabilityView(version: .iOS13)
    }
}

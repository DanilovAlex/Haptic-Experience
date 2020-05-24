//
//  FeedbackListRowView.swift
//  Haptic-Experience
//
//  Created by Alexander on 23.05.2020.
//  Copyright © 2020 Alexander Danilov. All rights reserved.
//

import SwiftUI

struct FeedbackListRowView: View {
    var name: String
    var image: UIImage? {
        return UIImage(named: name)
    }
    
    var body: some View {
        HStack(spacing: 12.0) {
            image.map { Image(uiImage: $0).resizable().frame(width: 40, height: 40, alignment: .center) }
            Text(name).font(.headline)
            Spacer()
        }.frame(height: 40, alignment: .center).padding(12.0)
    }
}

struct FeedbackListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FeedbackListRowView(name: "Impact")
            FeedbackListRowView(name: "Selection")
        }.previewLayout(.fixed(width: 300, height: 64))
    }
}

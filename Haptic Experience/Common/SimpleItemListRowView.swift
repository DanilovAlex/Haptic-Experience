//
//  SimpleItemListRowView.swift
//  Haptic-Experience
//
//  Created by Alexander on 23.05.2020.
//  Copyright © 2020 Alexander Danilov. All rights reserved.
//

import SwiftUI

struct SimpleItemListRowView: View {
    var title: String
    var image: UIImage? {
        return UIImage(named: title)
    }
    
    var body: some View {
        HStack(spacing: 12.0) {
            image.map { Image(uiImage: $0).resizable().frame(width: 40, height: 40, alignment: .center) }
            Text(title).font(.headline)
            Spacer()
        }.frame(height: 40, alignment: .center).padding(12.0)
    }
}

struct FeedbackListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SimpleItemListRowView(title: "Impact")
            SimpleItemListRowView(title: "Selection")
        }.previewLayout(.fixed(width: 300, height: 64))
    }
}

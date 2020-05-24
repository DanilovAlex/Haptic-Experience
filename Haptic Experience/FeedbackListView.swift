//
//  FeedbackListView.swift
//  Haptic-Experience
//
//  Created by Alexander on 23.05.2020.
//  Copyright © 2020 Alexander Danilov. All rights reserved.
//

import SwiftUI

struct FeedbackListView: View {
    var body: some View {
        List {
            NavigationLink(destination: ImpactFeedbackView()) {
                FeedbackListRowView(name: "Impact")
            }
        }.navigationBarTitle("UIKit Feedbacks")
    }
}

struct FeedbackListView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackListView()
    }
}

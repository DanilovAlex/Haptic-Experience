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
            NavigationLink(destination: SelectionFeedbackView()) {
                FeedbackListRowView(name: "Selection")
            }
            NavigationLink(destination: NotificationFeedbackView()) {
                FeedbackListRowView(name: "Notification")
            }
        }.navigationBarTitle("UIKit Feedbacks")
    }
}

struct FeedbackListView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackListView()
    }
}

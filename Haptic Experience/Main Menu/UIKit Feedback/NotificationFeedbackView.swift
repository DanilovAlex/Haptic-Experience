//
//  NotificationFeedbackView.swift
//  Haptic-Experience
//
//  Created by Alexander on 25.05.2020.
//  Copyright © 2020 Alexander Danilov. All rights reserved.
//

import SwiftUI
import UIKit

struct NotificationFeedbackView: View {
    let notification = UINotificationFeedbackGenerator()
    
    @State var isPerformingAction: Bool = false
    
    var body: some View {
        VStack {
            if isPerformingAction {
                ActivityIndicator(isAnimating: $isPerformingAction, style: .large)
            } else {
                RoundedButton(action: { self.performAction() }, title: "Perform action")
            }
        }.navigationBarTitle("Notification Feedback")
    }
    
    private func performAction() {
        guard !isPerformingAction else { return }
        
        isPerformingAction = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isPerformingAction = false
            self.notification.notificationOccurred(.success)
        }
    }
}

struct NotificationFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationFeedbackView()
    }
}

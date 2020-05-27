//
//  NotificationFeedbackView.swift
//  Haptic-Experience
//
//  Created by Alexander on 25.05.2020.
//  Copyright © 2020 Alexander Danilov. All rights reserved.
//

import SwiftUI
import UIKit

enum NotificationType {
    case success
    case warning
    case error
    
    var color: Color {
        switch self {
        case .success:
            return .green
            
        case .warning:
            return .orange
            
        case .error:
            return .red
        }
    }
    
    var feedback: UINotificationFeedbackGenerator.FeedbackType {
        switch self {
        case .success:
            return .success
            
        case .warning:
            return .warning
            
        case .error:
            return .error
        }
    }
    
    var name: String {
        switch self {
        case .success:
            return "Success"
            
        case .warning:
            return "Warning"
            
        case .error:
            return "Error"
        }
    }
}

struct NotificationFeedbackView: View {
    var body: some View {
        VStack(spacing: 64.0) {
            NotificationButton(notificationType: .success)
            NotificationButton(notificationType: .warning)
            NotificationButton(notificationType: .error)
        }.navigationBarTitle("Notification Feedback")
    }
}

struct NotificationFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationFeedbackView()
    }
}

struct NotificationButton: View {
    let notificationType: NotificationType
    
    let notification = UINotificationFeedbackGenerator()
    
    @State private var isPerformingAction: Bool = false
    
    var body: some View {
        Group {
            if isPerformingAction {
                ActivityIndicator(isAnimating: $isPerformingAction, style: .large)
            } else {
                RoundedButton(action: { self.performAction(result: self.notificationType.feedback) },
                              title: notificationType.name,
                              color: notificationType.color)
            }
        }.frame(height: 40.0, alignment: .center)
    }
    
    private func performAction(result: UINotificationFeedbackGenerator.FeedbackType) {
        guard !isPerformingAction else { return }
        
        isPerformingAction = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isPerformingAction = false
            self.notification.notificationOccurred(result)
        }
    }
}

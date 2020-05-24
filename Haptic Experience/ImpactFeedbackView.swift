//
//  ImpactFeedbackView.swift
//  Haptic-Experience
//
//  Created by Alexander on 23.05.2020.
//  Copyright © 2020 Alexander Danilov. All rights reserved.
//

import SwiftUI
import UIKit

struct ImpactFeedbackView: View {
    let heavy = UIImpactFeedbackGenerator(style: .heavy)
    let medium = UIImpactFeedbackGenerator(style: .medium)
    let light = UIImpactFeedbackGenerator(style: .light)
    let soft = UIImpactFeedbackGenerator(style: .soft)
    let rigid = UIImpactFeedbackGenerator(style: .rigid)
    let custom = UIImpactFeedbackGenerator()
    
    @State var intensity: Float = 0.5
    
    var formattedIntensity: String {
        return String(format: "%.2f", intensity)
    }
    
    var body: some View {
        VStack(spacing: 32.0) {
            VStack(spacing: 8.0) {
                HStack(spacing: 8.0) {
                    RoundedButton(action: { self.heavy.impactOccurred(intensity: CGFloat(self.intensity)) },
                                  title: "Heavy")
                    RoundedButton(action: { self.medium.impactOccurred(intensity: CGFloat(self.intensity)) },
                                  title: "Medium")
                    RoundedButton(action: { self.light.impactOccurred(intensity: CGFloat(self.intensity)) },
                                  title: "Light")
                }
                HStack(spacing: 8.0) {
                    RoundedButton(action: { self.soft.impactOccurred(intensity: CGFloat(self.intensity)) },
                                  title: "Soft", color: .orange)
                    RoundedButton(action: { self.rigid.impactOccurred(intensity: CGFloat(self.intensity)) },
                                  title: "Rigid", color: .orange)
                }
            }
            VStack(spacing: 8.0) {
                RoundedButton(action: { self.custom.impactOccurred(intensity: CGFloat(self.intensity))},
                              title: "Default",
                              color: .red)
                Slider(value: $intensity, in: 0...1, step: 0.05).padding()
                Text("Selected intensity: \(formattedIntensity)")
            }
        }.navigationBarTitle("Impact Feedback")
    }
}

struct UIKitFeedbacksView_Previews: PreviewProvider {
    static var previews: some View {
        ImpactFeedbackView()
    }
}

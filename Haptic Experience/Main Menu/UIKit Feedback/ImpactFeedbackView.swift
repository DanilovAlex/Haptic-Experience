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
            VStack(spacing: 32.0) {
                HStack(spacing: 32.0) {
                    RoundedButton(action: { self.heavy.impactOccurred(intensity: CGFloat(self.intensity)) },
                                  title: "Heavy", color: .yellow)
                    RoundedButton(action: { self.medium.impactOccurred(intensity: CGFloat(self.intensity)) },
                                  title: "Medium", color: .yellow)
                    RoundedButton(action: { self.light.impactOccurred(intensity: CGFloat(self.intensity)) },
                                  title: "Light", color: .yellow)
                }
                HStack(spacing: 32.0) {
                    RoundedButton(action: { self.soft.impactOccurred(intensity: CGFloat(self.intensity)) },
                                  title: "Soft", color: .yellow)
                    RoundedButton(action: { self.rigid.impactOccurred(intensity: CGFloat(self.intensity)) },
                                  title: "Rigid", color: .yellow)
                }
            }
            VStack(spacing: 8.0) {
                RoundedButton(action: { self.custom.impactOccurred(intensity: CGFloat(self.intensity))},
                              title: "Default")
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

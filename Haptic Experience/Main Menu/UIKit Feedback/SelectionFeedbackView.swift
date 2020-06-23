//
//  SelectionFeedbackView.swift
//  Haptic-Experience
//
//  Created by Alexander on 24.05.2020.
//  Copyright © 2020 Alexander Danilov. All rights reserved.
//

import SwiftUI
import UIKit

struct SelectionFeedbackView: View {
    let selectionGenerator = UISelectionFeedbackGenerator()
    
    @State var pickerValue: String = "Data 3"
    @State var toggleValue: Bool = false
    
    var body: some View {
        VStack(spacing: 48.0) {
            Spacer()
            RoundedButton(action: { self.selectionGenerator.selectionChanged() },
                          title: "Tap me",
                          color: .red)
            Text("Examples in iOS").font(.largeTitle).bold()
            Picker("", selection: $pickerValue) {
                Text("Data 1")
                Text("Data 2")
                Text("Data 3")
                Text("Data 4")
                Text("Data 5")
            }.padding(10)
            Toggle("Toggle", isOn: $toggleValue).padding(48)
            Spacer()
        }.navigationBarTitle("Selection Feedback")
    }
}

struct SelectionFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionFeedbackView()
    }
}

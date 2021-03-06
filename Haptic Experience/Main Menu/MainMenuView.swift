//
//  ContentView.swift
//  Haptic Experience
//
//  Created by Alexander on 22.05.2020.
//  Copyright © 2020 Alexander Danilov. All rights reserved.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 24.0) {
                NavigationLink(destination: FeedbackListView()) {
                    VStack {
                        Text("UIKit")
                            .font(.largeTitle)
                        AvailabilityView(version: .iOS10)
                    }.frame(height: 200, alignment: .center)
                }.buttonStyle(PlainButtonStyle())
                
                NavigationLink(destination: CoreHapticsListView()) {
                    VStack {
                        Text("CoreHaptics")
                            .font(.largeTitle)
                        AvailabilityView(version: .iOS13)
                    }.frame(height: 200, alignment: .center)
                }.buttonStyle(PlainButtonStyle())
            }.navigationBarTitle("Haptic Experience")
        }.accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}

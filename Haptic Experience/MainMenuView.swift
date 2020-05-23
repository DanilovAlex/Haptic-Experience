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
        VStack(spacing: 24.0) {
            VStack {
                Text("UIKit")
                    .font(.largeTitle)
                AvailabilityView(version: .iOS10)
            }.frame(height: 200, alignment: .center)
                        
            VStack {
                Text("CoreHaptics")
                    .font(.largeTitle)
                AvailabilityView(version: .iOS13)
            }.frame(height: 200, alignment: .center)
            
        }.navigationBarTitle("Haptic Experience")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}

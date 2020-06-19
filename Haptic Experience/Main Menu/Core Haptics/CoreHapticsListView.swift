//
//  CoreHapticsListView.swift
//  Haptic-Experience
//
//  Created by Alexander on 24.05.2020.
//  Copyright © 2020 Alexander Danilov. All rights reserved.
//

import SwiftUI

struct CoreHapticsListView: View {
    var body: some View {
        List {
            NavigationLink(destination: UIViewControllerSwiftUIRepresentableWrapper<HapticPaletteViewController>().navigationBarTitle("Haptic Palette")) {
                SimpleItemListRowView(title: "Haptic Palette")
            }
            NavigationLink(destination: HapticSamplesListView(viewModel: HapticSamplesViewModel())) {
                SimpleItemListRowView(title: "Haptic Samples")
            }
        }.navigationBarTitle("Core Haptics")
    }
}

struct CoreHapticsView_Previews: PreviewProvider {
    static var previews: some View {
        CoreHapticsListView()
    }
}

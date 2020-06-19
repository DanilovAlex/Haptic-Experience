//
//  HapticSamplesListView.swift
//  Haptic-Experience
//
//  Created by Alexander on 19.06.2020.
//  Copyright © 2020 Alexander Danilov. All rights reserved.
//

import SwiftUI

struct HapticSamplesListView: View {
    let viewModel: HapticSamplesViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.samples) { sample in
                Button(action: { self.viewModel.playSample(sample) }) {
                    Text(sample.name)
                }
            }
        }.navigationBarTitle("Haptic Samples")
    }
}

struct HapticSamplesListView_Previews: PreviewProvider {
    static var previews: some View {
        HapticSamplesListView(viewModel: HapticSamplesViewModel())
    }
}

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
        List(viewModel.samples) { sample in
            HStack {
                Spacer()
                RoundedButton(action: { self.viewModel.playSample(sample) },
                              title: sample.name,
                              color: .blue)
                Spacer()
            }.padding(20)
        }.navigationBarTitle("Haptic Samples")
    }
}

struct HapticSamplesListView_Previews: PreviewProvider {
    static var previews: some View {
        HapticSamplesListView(viewModel: HapticSamplesViewModel())
    }
}

//
//  UIViewControllerSwiftUIRepresentableWrapper.swift
//  Haptic-Experience
//
//  Created by Alexander on 18.06.2020.
//  Copyright © 2020 Alexander Danilov. All rights reserved.
//

import SwiftUI

final class UIViewControllerSwiftUIRepresentableWrapper<ViewController: UIViewController>: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {  }
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
}

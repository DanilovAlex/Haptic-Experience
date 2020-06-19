//
//  HapticSamplesViewModel.swift
//  Haptic-Experience
//
//  Created by Alexander on 19.06.2020.
//  Copyright © 2020 Alexander Danilov. All rights reserved.
//

import SwiftUI
import CoreHaptics

final class HapticSamplesViewModel {
    enum HapticSample: String, CaseIterable, Identifiable {
        case boing
        case drums
        case gravel
        case heartbeats
        case inflate
        case oscillate
        case rumble
        case sparkle
        
        var id: String {
            rawValue
        }
        
        var name: String {
            rawValue.prefix(1).uppercased() + rawValue.lowercased().dropFirst()
        }
        
        var url: URL {
            let path = Bundle.main.path(forResource: "AHAP/\(name)", ofType: "ahap")!
            return URL(fileURLWithPath: path)
        }
    }
    
    // Maintain a variable to check for Core Haptics compatibility on device.
    lazy var supportsHaptics: Bool = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.supportsHaptics
    }()
    
    let samples = HapticSample.allCases
    var engine: CHHapticEngine?
    
    init() {
        createEngine()
    }
    
    func playSample(_ sample: HapticSample) {
        // If the device doesn't support Core Haptics, abort.
        if !supportsHaptics {
            return
        }
        
        do {
            // Start the engine in case it's idle.
            try engine?.start()
            
            // Tell the engine to play a pattern.
            try engine?.playPattern(from: sample.url)
            
        } catch { // Engine startup errors
            print("An error occured playing sample \(sample.name): \(error).")
        }
    }
    
    private func createEngine() {
           // Create and configure a haptic engine.
           do {
               engine = try CHHapticEngine()
           } catch let error {
               print("Engine Creation Error: \(error)")
           }
           
           if engine == nil {
               print("Failed to create engine!")
           }
           
           // The stopped handler alerts you of engine stoppage due to external causes.
           engine?.stoppedHandler = { reason in
               print("The engine stopped for reason: \(reason.rawValue)")
               switch reason {
               case .audioSessionInterrupt: print("Audio session interrupt")
               case .applicationSuspended: print("Application suspended")
               case .idleTimeout: print("Idle timeout")
               case .systemError: print("System error")
               case .notifyWhenFinished: print("Playback finished")
               @unknown default:
                   print("Unknown error")
               }
           }
    
           // The reset handler provides an opportunity for your app to restart the engine in case of failure.
           engine?.resetHandler = {
               // Try restarting the engine.
               print("The engine reset --> Restarting now!")
               do {
                   try self.engine?.start()
               } catch {
                   print("Failed to restart the engine: \(error)")
               }
           }
       }
}

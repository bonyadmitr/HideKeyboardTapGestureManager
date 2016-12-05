//
//  TapGestureToHideKeyboard.swift
//  TapGestureToHideKeyboard
//
//  Created by Bondar Yaroslav on 01.12.16.
//  Copyright © 2016 Bondar Yaroslav. All rights reserved.
//

import UIKit

final public class HideKeyboardTapGestureManager: NSObject {
    
    // MARK: - Private
    
    private var gestures: [UITapGestureRecognizer] = []
    
    @IBOutlet private var targets: [UIView] = [] {
        didSet {
            for target in targets {
                addGesture(to: target)
            }
        }
    }
    
    private func isAdded(_ target: UIView) -> Bool {
        if let index = targets.index(of: target),
            let targetGestures = target.gestureRecognizers,
            targetGestures.contains(gestures[index]) {
            return true
        }
        return false
    }
    
    private func addGesture(to target: UIView) {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(HideKeyboardTapGestureManager.dismissKeyboard))
        target.addGestureRecognizer(gesture)
        gestures.append(gesture)
    }
    
    @objc private func dismissKeyboard() {
        if targets.count == 0 {
            return
        }
        targets.first?.topSuperview?.endEditing(true)
    }
    
    // MARK: - Public
    
    public func add(targets: [UIView]) {
        for (i, target) in targets.enumerated() {
            if isAdded(target) {
                print("HideKeyboardTapGestureManager Warning: you are trying to add already added target at index \(i)")
                continue
            }
            self.targets += [target]
        }
    }
    
    public func remove(targets: [UIView]) {
        for (i, target) in targets.enumerated() {
            if let index = self.targets.index(of: target) {
                target.removeGestureRecognizer(gestures[index])
                self.targets.remove(at: index)
                self.gestures.remove(at: index)
            } else {
                print("HideKeyboardTapGestureManager Warning: you didn't add target at index \(i), but you are trying to remove it")
            }
        }
    }
    
    public func removeAllTargets() {
        remove(targets: targets)
    }
}

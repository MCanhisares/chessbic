//
//  UIView+Jiggle.swift
//  Chessbic
//
//  Created by Marcel Canhisares on 2024-03-29.
//

import Foundation
import UIKit

extension UIView {
    func jiggle(amount: CGFloat = 5, duration: TimeInterval = 0.5) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(
            name: CAMediaTimingFunctionName.linear
        )
        animation.duration = duration
        animation.values = [
            -amount, amount,
             -amount, amount,
             -amount / 2, amount / 2,
             -amount / 4, amount / 4,
             0
        ]
        layer.add(animation, forKey: "shake")
    }
}

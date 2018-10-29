//
//  AnimationType.swift
//  UITableViewCellAnimation-Article-Starter
//
//  Created by Maxim Kovalko on 10/29/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import UIKit

enum AnimationType {
    case fade(duration: TimeInterval, delayFactor: Double)
    case moveUpWithBounce(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double)
    case moveUpWithFade(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double)
    case slideIn(duration: TimeInterval, delayFactor: Double)
    case scale(duration: TimeInterval, delayFactor: Double)
    
    var animation: Animation {
        switch self {
        case let .fade(duration, delayFactor):
            return AnimationFactory.makeFadeAnimation(
                duration: duration,
                delayFactor: delayFactor
            )
        case let .moveUpWithBounce(rowHeight, duration, delayFactor):
            return AnimationFactory.makeMoveUpWithBounce(
                rowHeight: rowHeight,
                duration: duration,
                delayFactor: delayFactor
            )
        case let .moveUpWithFade(rowHeight, duration, delayFactor):
            return AnimationFactory.makeMoveUpWithFade(
                rowHeight: rowHeight,
                duration: duration,
                delayFactor: delayFactor
            )
        case let .slideIn(duration, delayFactor):
            return AnimationFactory.makeSlideIn(
                duration: duration,
                delayFactor: delayFactor
            )
        case let .scale(duration, delayFactor):
            return AnimationFactory.makeScale(
                duration: duration,
                delayFactor: delayFactor
            )
        }
    }
    
    var description: String {
        switch self {
        case .fade:
            return "Fade"
        case .moveUpWithBounce:
            return "Move Up with Bounce"
        case .moveUpWithFade:
            return "Move Up with Fade"
        case .slideIn:
            return "Slide In"
        case .scale:
            return "Scale"
        }
    }
}

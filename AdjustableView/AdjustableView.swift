//
//  AdjustableView.swift
//  AdjustableView
//
//  Created by Tai Le on 10/18/20.
//

import UIKit

open class AdjustableView: UIView {
    public var onDragingStarted: (() -> Void)?
    public var onDragingEnded: (() -> Void)?
    public var onFrameChanged: ((CGRect) -> Void)?

    public lazy var panGesture: UIPanGestureRecognizer = {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        gesture.minimumNumberOfTouches = 1
        return gesture
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        addGestureRecognizer(panGesture)
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Privates

extension AdjustableView {
    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .began:
            onDragingStarted?()
        case .changed:
            if gesture.numberOfTouches == 2 {
                let p1 = gesture.location(ofTouch: 0, in: superview)
                let p2 = gesture.location(ofTouch: 1, in: superview)
                self.frame = CGRect(p1: p1, p2: p2)
            } else {
                let translation = gesture.translation(in: superview)
                center = CGPoint(x: center.x + translation.x, y: center.y + translation.y)
            }
            gesture.setTranslation(.zero, in: superview)
            onFrameChanged?(frame)
        case .ended, .cancelled, .failed:
            onDragingEnded?()
        case .possible:
            break
        @unknown default:
            break
        }
    }
}

// MARK: - CGRect

extension CGRect {
    init(p1: CGPoint, p2: CGPoint) {
        self.init(x: min(p1.x, p2.x),
                  y: min(p1.y, p2.y),
                  width: abs(p1.x - p2.x),
                  height: abs(p1.y - p2.y))
    }
}

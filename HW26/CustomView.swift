//
//  CustomView.swift
//  HW26
//
//  Created by mac on 14.07.2025.
//
import UIKit

class CustomView: UIView {
    
    var nameInstance: String?
    var delegateView: ICustomViewDelegate?
    
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, with: event)
        
        if let hitView = hitView as? CustomView {
            if let name = hitView.nameInstance {
                hitView.delegateView?.pressedViewDelegate(name)
            } else {
                print("nil")
            }
        }
        return hitView
    }
}
//MARK: - Protocol Delegate
protocol ICustomViewDelegate {
    
    func pressedViewDelegate(_ nameView: String)
}

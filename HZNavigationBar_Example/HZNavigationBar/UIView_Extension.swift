//
//  UIView_Extension.swift
//  test
//
//  Created by 何志志 on 2019/3/7.
//  Copyright © 2019 何志志. All rights reserved.
//

import UIKit

extension UIView {
    
    func constrainCentered(_ subview: UIView) {
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        let verticalContraint = NSLayoutConstraint(
            item: subview,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerY,
            multiplier: 1.0,
            constant: 0)
        
        let horizontalContraint = NSLayoutConstraint(
            item: subview,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0)
        
        let heightContraint = NSLayoutConstraint(
            item: subview,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: subview.frame.size.height)
        
        let widthContraint = NSLayoutConstraint(
            item: subview,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: subview.frame.size.width)
        
        addConstraints([
            horizontalContraint,
            verticalContraint,
            heightContraint,
            widthContraint])
        
    }
    
    func constrainToEdges(_ subview: UIView) {
        
        subview.translatesAutoresizingMaskIntoConstraints = false

        let topContraint = NSLayoutConstraint(
            item: subview,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .top,
            multiplier: 1.0,
            constant: 0)
        
        let bottomConstraint = NSLayoutConstraint(
            item: subview,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 0)
        
        let leadingContraint = NSLayoutConstraint(
            item: subview,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self,
            attribute: .leading,
            multiplier: 1.0,
            constant: 0)
        
        let trailingContraint = NSLayoutConstraint(
            item: subview,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailing,
            multiplier: 1.0,
            constant: 0)
        
        addConstraints([
            topContraint,
            bottomConstraint,
            leadingContraint,
            trailingContraint])
    }
    
    func constrainToLeadingTopBottomWidth(_ subview: UIView, targetView: UIView? = nil, leading: CGFloat = 0, top: CGFloat = 0, bottom: CGFloat = 0, width: CGFloat? = nil) {
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        var _targetView: UIView? = targetView
        var isLeadingToTrailing: Bool = true    //是否左边相对于目标View右边
        if _targetView == nil {  // 相对于父控件
            _targetView = self
            isLeadingToTrailing = false
        }
        
        let topContraint = NSLayoutConstraint(
            item: subview,
            attribute: .top,
            relatedBy: .equal,
            toItem: _targetView,
            attribute: .top,
            multiplier: 1.0,
            constant: top)
        
        let bottomConstraint = NSLayoutConstraint(
            item: subview,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: _targetView,
            attribute: .bottom,
            multiplier: 1.0,
            constant: bottom)
        
        let leadingContraint = NSLayoutConstraint(
            item: subview,
            attribute: .leading,
            relatedBy: .equal,
            toItem: _targetView,
            attribute: isLeadingToTrailing ? .trailing : .leading,
            multiplier: 1.0,
            constant: leading)
        
        if let _width = width {
            let widthContraint = NSLayoutConstraint(
                item: subview,
                attribute: .width,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1.0,
                constant: _width)
            
            addConstraint(widthContraint)
        }
        
        
        addConstraints([
            topContraint,
            bottomConstraint,
            leadingContraint])
    }
    
    func constrainToTrailingTopBottomWidth(_ subview: UIView, targetView: UIView? = nil, trailing: CGFloat = 0, top: CGFloat = 0, bottom: CGFloat = 0, width: CGFloat? = nil) {
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        var _targetView: UIView? = targetView
        var isTrailingToLeading: Bool = true    //是否右边相对于目标View左边
        if _targetView == nil {
            _targetView = self
            isTrailingToLeading = false
        }
        
        let topContraint = NSLayoutConstraint(
            item: subview,
            attribute: .top,
            relatedBy: .equal,
            toItem: _targetView,
            attribute: .top,
            multiplier: 1.0,
            constant: top)
        
        let bottomConstraint = NSLayoutConstraint(
            item: subview,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: _targetView,
            attribute: .bottom,
            multiplier: 1.0,
            constant: bottom)
        
        let trailingContraint = NSLayoutConstraint(
            item: subview,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: _targetView,
            attribute: isTrailingToLeading ? .leading : .trailing,
            multiplier: 1.0,
            constant: trailing)
        
        if let _width = width {
            let widthContraint = NSLayoutConstraint(
                item: subview,
                attribute: .width,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1.0,
                constant: _width)
            
            addConstraint(widthContraint)
        }
        
        addConstraints([
            topContraint,
            bottomConstraint,
            trailingContraint])
    }
    
}
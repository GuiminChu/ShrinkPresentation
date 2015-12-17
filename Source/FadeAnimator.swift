//
//  FadeAnimator.swift
//
//  Copyright © 2015 GuiminChu All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit

class FadeAnimator: NSObject {
    
    enum Mode {
        case Presentation
        case Dismissal
    }
    
    private let duration = 0.3
    private let mode: Mode
    
    init(_ mode: Mode) {
        self.mode = mode
    }
    
    func presentationAnimate(context: UIViewControllerContextTransitioning) {
        let menuViewController = context.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let menuView = menuViewController.view
        context.containerView()!.addSubview(menuView)
        
        menuView.alpha = 0.0
        
        UIView.animateWithDuration(duration,
            animations: {
                menuView.alpha = 1.0
            }, completion: { _ in
                context.completeTransition(true)
        })
    }
    
    func dismissalAnimate(context: UIViewControllerContextTransitioning) {
        let menuViewController = context.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let menuView = menuViewController.view
        
        UIView.animateWithDuration(duration,
            animations: {
                menuView.alpha = 0.0
            }, completion: { _ in
                context.completeTransition(true)
        })        
    }
}

extension FadeAnimator: UIViewControllerAnimatedTransitioning {

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        switch mode {
        case .Presentation:
            presentationAnimate(transitionContext)
        case .Dismissal:
            dismissalAnimate(transitionContext)
        }
    }
}

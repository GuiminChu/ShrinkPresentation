//
//  ShrinkPresentationController.swift
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

class ShrinkPresentationController: UIPresentationController {
    
    let effectContainerView = UIView()
    let blurView = UIVisualEffectView()
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
        
        let effect = UIBlurEffect(style: .Dark)
        blurView.effect = effect
        
        effectContainerView.alpha = 0.0
    }
    
    override func presentationTransitionWillBegin() {
        effectContainerView.frame = containerView!.bounds
        blurView.frame = containerView!.bounds
        
        effectContainerView.insertSubview(blurView, atIndex: 0)
        
        containerView!.addSubview(presentingViewController.view)
        containerView!.addSubview(effectContainerView)
        
        UIView.animateWithDuration(0.08) {
            self.effectContainerView.alpha = 1.0
        }
        
        presentedViewController.transitionCoordinator()?.animateAlongsideTransition({ context in
            
            self.presentingViewController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.92, 0.92)
            
            }, completion: nil)
    }
    
    override func presentationTransitionDidEnd(completed: Bool) {
        
        if !completed {
            effectContainerView.removeFromSuperview()
        }
        
    }
    
    override func dismissalTransitionWillBegin() {
        
        UIView.animateWithDuration(0.08) {
            self.presentingViewController.view.transform = CGAffineTransformIdentity
        }
        
        presentedViewController.transitionCoordinator()?.animateAlongsideTransition({ (context) -> Void in
            self.effectContainerView.alpha = 0.0
            }, completion: nil)
    }
    
    override func dismissalTransitionDidEnd(completed: Bool) {
        if completed {
            self.effectContainerView.removeFromSuperview()
        }
     
        UIApplication.sharedApplication().keyWindow?.addSubview(self.presentingViewController.view)
    }
}

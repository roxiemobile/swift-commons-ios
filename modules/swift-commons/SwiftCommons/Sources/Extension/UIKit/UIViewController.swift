// ----------------------------------------------------------------------------
//
//  UIViewController.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

import UIKit

// ----------------------------------------------------------------------------

extension UIViewController
{
// MARK: - Construction

    public convenience init(nibName nibNameOrNil: String?) {
        self.init(nibName: nibNameOrNil, bundle: nil)
    }

// MARK: - Methods

    public class func mdc_controller() -> Self
    {
        // Load a .NIB whose name is the same as view controller's class
        return mdc_controller(nibName: defaultResourceName(self), bundle: nil)
    }

    public class func mdc_controller(nibName nibNameOrNil: String?) -> Self
    {
        // Initialize view controller with the .NIB file
        return mdc_controller(nibName: nibNameOrNil, bundle: nil)
    }

    public class func mdc_controller(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) -> Self
    {
        // Bugfix for iOS Simulator
        let nibName = nibNameOrNil ?? defaultResourceName(self)

        // Initialize view controller with the .NIB file
        let controller = self.init(nibName: nibName, bundle: nibBundleOrNil) as UIViewController
        return typeCast(controller, type: self)
    }

    public class func mdc_controller(storyboardName storyboardNameOrNil: String?) -> Self?
    {
        // Initialize view controller with the .Storyboard file
        return mdc_controller(storyboardName: storyboardNameOrNil, bundle: nil)
    }

    public class func mdc_controller(storyboardName storyboardNameOrNil: String?, bundle storyboardBundleOrNil: NSBundle?) -> Self?
    {
        // Bugfix for iOS Simulator
        let storyboardName = storyboardNameOrNil ?? defaultResourceName(self)

        // Initialize view controller with the .Storyboard file
        let controller = UIStoryboard(name: storyboardName, bundle: storyboardBundleOrNil).instantiateInitialViewController()
        return optionalTypeCast(controller, type: self)
    }

// MARK: -

// FIXME: uncomment!
//
//    // Adds the given view controller as a children controller to the parent controller
//    + (void)addChildViewController:(UIViewController *)childController toParentViewController:(UIViewController *)parentController
//            withAnimationOptions:(UIViewAnimationOptions)options completion:(void (^)(BOOL finished))completionBlock;
//    + (void)addChildViewController:(UIViewController *)childController toParentViewController:(UIViewController *)parentController
//            withAnimationOptions:(UIViewAnimationOptions)options completion:(void (^)(BOOL finished))completionBlock
//    {
//        if (parentController == nil || childController == nil)
//            return;
//
//        // Fix for "viewDidLoad" after transition
//        UIView *childView = childController.view;
//
//        // Add child controller
//        [parentController addChildViewController:childController];
//
//        // Set child controller view frame equal to parent controller container frame
//        childView.frame = parentController.view.bounds;
//
//        // Add child view
//        if (options == UIViewAnimationOptionTransitionNone)
//        {
//            // Add without animation
//            [parentController.view addSubview:childView];
//
//            if (completionBlock) {
//                completionBlock(YES);
//            }
//        }
//        else
//        {
//            // Transition with animation
//            [UIView transitionWithView:parentController.view
//                    duration:kTransitionAnimationDuration
//                    options:options
//                    animations:^() {
//                        [parentController.view addSubview:childView];
//                    }
//                    completion:completionBlock];
//        }
//    }

// FIXME: uncomment!
//        public class func addChildViewController(childController: UIViewController, toParentViewController: UIViewController, withAnimationOptions options: UIViewAnimationOptions, completion: FinishedCompletionHandler? = nil)
//        {
//    //        if (parentController == nil || childController == nil)
//    //            return;
//    //
//    //        // Fix for "viewDidLoad" after transition
//    //        UIView *childView = childController.view;
//    //
//    //        // Add child controller
//    //        [parentController addChildViewController:childController];
//    //
//    //        // Set child controller view frame equal to parent controller container frame
//    //        childView.frame = parentController.view.bounds;
//    //
//    //        // Add child view
//    //        if (options == UIViewAnimationOptionTransitionNone)
//    //        {
//    //            // Add without animation
//    //            [parentController.view addSubview:childView];
//    //
//    //            if (completionBlock) {
//    //                completionBlock(YES);
//    //            }
//    //        }
//    //        else
//    //        {
//    //            // Transition with animation
//    //            [UIView transitionWithView:parentController.view
//    //                    duration:kTransitionAnimationDuration
//    //                    options:options
//    //                    animations:^() {
//    //                        [parentController.view addSubview:childView];
//    //                    }
//    //                    completion:completionBlock];
//    //        }
//        }
//
//        public class func addChildViewController(childController: UIViewController, toParentViewController parentController: UIViewController, completion: FinishedCompletionHandler? = nil) {
//            addChildViewController(childController, toParentViewController: parentController, withAnimationOptions: .TransitionCrossDissolve, completion: completion)
//        }

// MARK: -

// FIXME: uncomment!
//
//    // Removes the the receiver from its parent's children controllers array
//    + (void)removeFromParentViewController:(UIViewController *)childController withAnimationOptions:(UIViewAnimationOptions)options
//            completion:(void (^)(BOOL finished))completionBlock;
//    + (void)removeFromParentViewController:(UIViewController *)childController
//            withAnimationOptions:(UIViewAnimationOptions)options completion:(void (^)(BOOL finished))completionBlock
//    {
//        UIViewController *containerController = childController.parentViewController;
//        if (containerController)
//        {
//            if (options == UIViewAnimationOptionTransitionNone)
//            {
//                // Remove without animation
//                [childController.view removeFromSuperview];
//                [childController removeFromParentViewController];
//
//                if (completionBlock) {
//                    completionBlock(YES);
//                }
//            }
//            else
//            {
//                // Transition with animation
//                [UIView transitionWithView:containerController.view
//                        duration:kTransitionAnimationDuration
//                        options:options
//                        animations:^() {
//                            [childController.view removeFromSuperview];
//                        }
//                        completion:^(BOOL finished) {
//                            [childController removeFromParentViewController];
//
//                            if (completionBlock) {
//                                completionBlock(finished);
//                            }
//                        }];
//            }
//        }
//    }

// FIXME: uncomment!
//        public class func removeFromParentViewController(childController: UIViewController, withAnimationOptions options: UIViewAnimationOptions, completion: FinishedCompletionHandler? = nil)
//        {
//    //        UIViewController *containerController = childController.parentViewController;
//    //        if (containerController)
//    //        {
//    //            if (options == UIViewAnimationOptionTransitionNone)
//    //            {
//    //                // Remove without animation
//    //                [childController.view removeFromSuperview];
//    //                [childController removeFromParentViewController];
//    //
//    //                if (completionBlock) {
//    //                    completionBlock(YES);
//    //                }
//    //            }
//    //            else
//    //            {
//    //                // Transition with animation
//    //                [UIView transitionWithView:containerController.view
//    //                        duration:kTransitionAnimationDuration
//    //                        options:options
//    //                        animations:^() {
//    //                            [childController.view removeFromSuperview];
//    //                        }
//    //                        completion:^(BOOL finished) {
//    //                            [childController removeFromParentViewController];
//    //
//    //                            if (completionBlock) {
//    //                                completionBlock(finished);
//    //                            }
//    //                        }];
//    //            }
//    //        }
//        }
//
//        public class func removeFromParentViewController(childController: UIViewController, completion: FinishedCompletionHandler? = nil) {
//            removeFromParentViewController(childController, withAnimationOptions: .TransitionCrossDissolve, completion: completion)
//        }

// MARK: -

// FIXME: uncomment!
//
//    // Loads a view from .NIB file
//    - (UIView *)loadViewOfClass:(Class)clazz fromNibNamed:(NSString *)nibNameOrNil
//    {
//        // Initialize view with the .NIB file
//        UIView *view = [self loadViewOfClass:clazz fromNibNamed:nibNameOrNil
//                bundle:[NSBundle mainBundle]];
//        return  view;
//    }

// FIXME: uncomment!
//
//    - (UIView *)loadViewOfClass:(Class)clazz fromNibNamed:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundle
//    {
//        if (clazz == nil)
//            return nil;
//
//        // Bugfix for iOS Simulator
//        if (nibNameOrNil == nil) {
//            nibNameOrNil =  NSStringFromClass(clazz);
//        }
//
//        // Initialize view with the .NIB file
//        UIView *view = [UIView loadViewOfClass:clazz fromNibNamed:nibNameOrNil
//                withOwner:self withOptions:nil bundle:nibBundle];
//        return  view;
//    }

// MARK: -

// FIXME: uncomment!
//
//    // Returns first found view controller
//    - (UIViewController *)firstViewController
//    {
//        id nextResponder = [self nextResponder];
//        if ([nextResponder isKindOfClass:UIViewController.class]) {
//            return nextResponder;
//        }
//        else
//        if ([nextResponder isKindOfClass:UIView.class]) {
//            return [nextResponder firstViewController];
//        }
//        else {
//            return nil;
//        }
//    }

// MARK: - Private Methods

    private class func defaultResourceName(object: AnyObject) -> String {
        return NSStringFromClass(object_getClass(object)).componentsSeparatedByString(".").last!
    }

// MARK: - Inner Types

// FIXME: uncomment!
//    // FIXME: Rename this typealias
//    public typealias FinishedCompletionHandler = (@objc_block (finished: Bool) -> Void)

// MARK: - Constants

    private struct Inner {
        static let TransitionAnimationDuration: CGFloat = 0.3
    }

}

// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
//
//  UIImage.swift
//
//  @author     Vasily Ivanov <IvanovVF@ekassir.com>
//  @copyright  Copyright (c) 2016, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import UIKit

// ----------------------------------------------------------------------------

extension UIImage
{
// MARK: - Functions
    
    public static func resizeImage(originalImage: UIImage, size: CGSize) -> UIImage?
    {
        // Create drawing context
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        originalImage.drawInRect(CGRectMake(0.0, 0.0, size.width, size.height))
        
        // Capture resultant image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        // Done
        return image
    }
    
    public func resizedImageWithSize(size: CGSize) -> UIImage? {
        return UIImage.resizeImage(self, size: size)
    }
    
    public static func resizeImage(image: UIImage, scale: Float) -> UIImage? {
        return image.resizedImageWithSize(Inner.scaledSize(image.size, scale: scale))
    }
    
    public func resizedImageWithScale(scale: Float) -> UIImage? {
        return UIImage.resizeImage(self, scale: scale)
    }

// MARK: - Constants
    
    private struct Inner
    {
        private static func scaledSize(size: CGSize, scale: Float) -> CGSize {
            return CGSize(width: size.width * CGFloat(scale), height: size.height * CGFloat(scale))
        }
    }

}

// ----------------------------------------------------------------------------

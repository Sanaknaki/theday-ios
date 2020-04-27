//
//  Extensions.swift
//  Theday
//
//  Created by Ali Sanaknaki on 2020-04-12.
//  Copyright © 2020 Ali Sanaknaki. All rights reserved.
//

import UIKit

extension UIColor {
    
    // Simplify creating RGB colours
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static func theRed() -> UIColor {
        return UIColor.rgb(red: 206, green: 70, blue: 70)
    }
    
    static func mainBlue() -> UIColor {
        return UIColor.rgb(red: 89, green: 204, blue: 242)
    }
    
    static func lightMainBlue() -> UIColor {
        return UIColor.rgb(red: 125, green: 216, blue: 246)
    }
    
    static func mainGray() -> UIColor {
        return UIColor.rgb(red: 184, green: 193, blue: 199)
    }
}

extension UIView {
    
    // Anchoring is crazy, this is a lot to take in.
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,  paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top { self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true }
        if let left = left { self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true }
        if let bottom = bottom { self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true }
        if let right = right { self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true }
        if width != 0 { widthAnchor.constraint(equalToConstant: width).isActive = true }
        if height != 0 { heightAnchor.constraint(equalToConstant: height).isActive = true }
    }
}

extension Date {
    func timeAgoDisplay(userDate: Bool) -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        let month = 4 * week

        let quotient: Int
        let unit: String
        if secondsAgo < minute {
            quotient = secondsAgo
            unit = "sec"
        } else if secondsAgo < hour {
            quotient = secondsAgo / minute
            unit = "min"
        } else if secondsAgo < day {
            quotient = secondsAgo / hour
            unit = "hr"
        } else if secondsAgo < week {
            quotient = secondsAgo / day
            unit = "day"
        } else if secondsAgo < month {
            quotient = secondsAgo / week
            unit = "wk"
        } else {
            quotient = secondsAgo / month
            unit = "mth"
        }

        if(userDate) {
            return "\(quotient) \(unit)\(quotient == 1 ? "" : "s")"
        } else {
            return "\(quotient) \(unit)\(quotient == 1 ? "" : "s") ago"
        }
        
    }
}
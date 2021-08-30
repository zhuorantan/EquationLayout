//
//  Extensions.swift
//  
//
//  Created by Zhuoran Tan on 8/19/21.
//

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

extension Collection where Element == NSLayoutConstraint {
  func activate() {
    NSLayoutConstraint.activate(Array(self))
  }

  func deactivate() {
    NSLayoutConstraint.deactivate(Array(self))
  }
}

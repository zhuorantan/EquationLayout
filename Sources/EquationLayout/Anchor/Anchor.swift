//
//  Anchor.swift
//  
//
//  Created by Zhuoran Tan on 8/19/21.
//

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

public protocol Anchor {
  associatedtype AnchorType: AnyObject
  associatedtype LayoutAnchor: NSLayoutAnchor<AnchorType>

  var layoutAnchor: LayoutAnchor { get }
  var constant: CGFloat { get }

  func withConstant(_ constant: CGFloat) -> Self

  func constraint(equalTo anchor: Self) -> NSLayoutConstraint
  func constraint(greaterThanOrEqualTo anchor: Self) -> NSLayoutConstraint
  func constraint(lessThanOrEqualTo anchor: Self) -> NSLayoutConstraint
}

public extension Anchor {
  func constraint(equalTo anchor: Self) -> NSLayoutConstraint {
    let constant = anchor.constant - constant
    return layoutAnchor.constraint(equalTo: anchor.layoutAnchor, constant: constant)
  }

  func constraint(greaterThanOrEqualTo anchor: Self) -> NSLayoutConstraint {
    let constant = anchor.constant - constant
    return layoutAnchor.constraint(greaterThanOrEqualTo: anchor.layoutAnchor, constant: constant)
  }

  func constraint(lessThanOrEqualTo anchor: Self) -> NSLayoutConstraint {
    let constant = anchor.constant - constant
    return layoutAnchor.constraint(lessThanOrEqualTo: anchor.layoutAnchor, constant: constant)
  }
}

public func == <T: Anchor>(left: T, right: T) -> NSLayoutConstraint {
  left.constraint(equalTo: right)
}

public func >= <T: Anchor>(left: T, right: T) -> NSLayoutConstraint {
  left.constraint(greaterThanOrEqualTo: right)
}

public func <= <T: Anchor>(left: T, right: T) -> NSLayoutConstraint {
  left.constraint(lessThanOrEqualTo: right)
}

public func + <T: Anchor>(left: T, right: CGFloat) -> T {
  left.withConstant(right)
}

public func - <T: Anchor>(left: T, right: CGFloat) -> T {
  left + -right
}

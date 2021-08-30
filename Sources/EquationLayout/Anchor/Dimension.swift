//
//  Dimension.swift
//  
//
//  Created by Zhuoran Tan on 8/19/21.
//

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

public struct Dimension: Anchor {
  public typealias AnchorType = NSLayoutDimension

  public var layoutAnchor: NSLayoutDimension
  public var constant: CGFloat = 0
  public var multiplier: CGFloat = 1

  public func withConstant(_ constant: CGFloat) -> Dimension {
    Dimension(layoutAnchor: layoutAnchor, constant: constant, multiplier: multiplier)
  }

  public func withMultiplier(_ multiplier: CGFloat) -> Dimension {
    Dimension(layoutAnchor: layoutAnchor, constant: constant * multiplier, multiplier: multiplier)
  }
}

public extension Dimension {
  func constraint(equalTo anchor: Dimension) -> NSLayoutConstraint {
    let multiplier = anchor.multiplier / multiplier
    let constant = (anchor.constant - constant) * multiplier

    return layoutAnchor.constraint(equalTo: anchor.layoutAnchor, multiplier: multiplier, constant: constant)
  }

  func constraint(greaterThanOrEqualTo anchor: Dimension) -> NSLayoutConstraint {
    let multiplier = anchor.multiplier / multiplier
    let constant = (anchor.constant - constant) * multiplier

    return layoutAnchor.constraint(greaterThanOrEqualTo: anchor.layoutAnchor, multiplier: multiplier, constant: constant)
  }

  func constraint(lessThanOrEqualTo anchor: Dimension) -> NSLayoutConstraint {
    let multiplier = anchor.multiplier / multiplier
    let constant = (anchor.constant - constant) * multiplier

    return layoutAnchor.constraint(lessThanOrEqualTo: anchor.layoutAnchor, multiplier: multiplier, constant: constant)
  }

  func constraint(equalToConstant constant: CGFloat) -> NSLayoutConstraint {
    let newConstant = (constant - self.constant) / multiplier

    return layoutAnchor.constraint(equalToConstant: newConstant)
  }

  func constraint(greaterThanOrEqualToConstant constant: CGFloat) -> NSLayoutConstraint {
    let newConstant = (constant - self.constant) / multiplier

    return layoutAnchor.constraint(greaterThanOrEqualToConstant: newConstant)
  }

  func constraint(lessThanOrEqualToConstant constant: CGFloat) -> NSLayoutConstraint {
    let newConstant = (constant - self.constant) / multiplier

    return layoutAnchor.constraint(lessThanOrEqualToConstant: newConstant)
  }
}

public func * (left: Dimension, right: CGFloat) -> Dimension {
  left.withMultiplier(right)
}

public func / (left: Dimension, right: CGFloat) -> Dimension {
  left * (1 / right)
}

public func == (left: Dimension, right: CGFloat) -> NSLayoutConstraint {
  left.constraint(equalToConstant: right)
}

public func >= (left: Dimension, right: CGFloat) -> NSLayoutConstraint {
  left.constraint(greaterThanOrEqualToConstant: right)
}

public func <= (left: Dimension, right: CGFloat) -> NSLayoutConstraint {
  left.constraint(lessThanOrEqualToConstant: right)
}

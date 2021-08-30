//
//  YAxisAnchor.swift
//
//
//  Created by Zhuoran Tan on 8/19/21.
//

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

public struct YAxisAnchor: Anchor {
  public typealias AnchorType = NSLayoutYAxisAnchor

  public var layoutAnchor: NSLayoutYAxisAnchor
  public var constant: CGFloat = 0

  public func withConstant(_ constant: CGFloat) -> YAxisAnchor {
    YAxisAnchor(layoutAnchor: layoutAnchor, constant: constant)
  }
}

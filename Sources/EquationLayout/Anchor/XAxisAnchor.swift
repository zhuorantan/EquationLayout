//
//  XAxisAnchor.swift
//  
//
//  Created by Zhuoran Tan on 8/19/21.
//

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

public struct XAxisAnchor: Anchor {
  public typealias AnchorType = NSLayoutXAxisAnchor

  public var layoutAnchor: NSLayoutXAxisAnchor
  public var constant: CGFloat = 0

  public func withConstant(_ constant: CGFloat) -> XAxisAnchor {
    XAxisAnchor(layoutAnchor: layoutAnchor, constant: constant)
  }
}

//
//  Anchorable.swift
//  
//
//  Created by Zhuoran Tan on 8/19/21.
//

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

public protocol Anchorable {
  var widthAnchor: NSLayoutDimension { get }
  var heightAnchor: NSLayoutDimension { get }
  var topAnchor: NSLayoutYAxisAnchor { get }
  var bottomAnchor: NSLayoutYAxisAnchor { get }
  var leadingAnchor: NSLayoutXAxisAnchor { get }
  var trailingAnchor: NSLayoutXAxisAnchor { get }
  var centerXAnchor: NSLayoutXAxisAnchor { get }
  var centerYAnchor: NSLayoutYAxisAnchor { get }
}

public extension Anchorable {
  var width: Dimension {
    Dimension(layoutAnchor: widthAnchor)
  }

  var height: Dimension {
    Dimension(layoutAnchor: heightAnchor)
  }

  var top: YAxisAnchor {
    YAxisAnchor(layoutAnchor: topAnchor)
  }

  var bottom: YAxisAnchor {
    YAxisAnchor(layoutAnchor: bottomAnchor)
  }

  var leading: XAxisAnchor {
    XAxisAnchor(layoutAnchor: leadingAnchor)
  }

  var trailing: XAxisAnchor {
    XAxisAnchor(layoutAnchor: trailingAnchor)
  }

  var centerX: XAxisAnchor {
    XAxisAnchor(layoutAnchor: centerXAnchor)
  }

  var centerY: YAxisAnchor {
    YAxisAnchor(layoutAnchor: centerYAnchor)
  }

  func edges(_ edges: EdgesAnchor.Edges = .all) -> EdgesAnchor {
    EdgesAnchor(edges: edges, view: self)
  }
}

#if os(iOS)
extension UIView: Anchorable {}
extension UILayoutGuide: Anchorable {}
#elseif os(macOS)
extension NSView: Anchorable {}
extension NSLayoutGuide: Anchorable {}
#endif

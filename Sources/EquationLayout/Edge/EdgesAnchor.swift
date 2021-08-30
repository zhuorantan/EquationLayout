//
//  File.swift
//  
//
//  Created by Zhuoran Tan on 8/19/21.
//

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

public struct EdgesAnchor {
  public struct Edges: OptionSet {
    public static let top = Edges(rawValue: 1 << 0)
    public static let leading = Edges(rawValue: 1 << 2)
    public static let bottom = Edges(rawValue: 1 << 1)
    public static let trailing = Edges(rawValue: 1 << 3)

    public static let all: Edges = [.top, .leading, .bottom, .trailing]

    public let rawValue: Int

    public init(rawValue: Int) {
      self.rawValue = rawValue
    }
  }

  var edges: Edges
  var view: Anchorable

  #if os(iOS)
  var constant: UIEdgeInsets = .zero

  func withConstant(_ constant: UIEdgeInsets) -> EdgesAnchor {
    EdgesAnchor(edges: edges, view: view, constant: constant)
  }
  #elseif os(macOS)
  var constant: NSEdgeInsets = .zero

  func withConstant(_ constant: NSEdgeInsets) -> EdgesAnchor {
    EdgesAnchor(edges: edges, view: view, constant: constant)
  }
  #endif

  fileprivate func equalConstraints(to view: Anchorable) -> [NSLayoutConstraint] {
    var constraints: [NSLayoutConstraint] = []

    if edges.contains(.top) {
      constraints.append(view.top == view.top + constant.top)
    }
    if edges.contains(.leading) {
      constraints.append(view.leading == view.leading + constant.left)
    }
    if edges.contains(.bottom) {
      constraints.append(view.bottom == view.bottom + constant.bottom)
    }
    if edges.contains(.trailing) {
      constraints.append(view.trailing == view.trailing + constant.right)
    }

    return constraints
  }
}

func == (left: EdgesAnchor, right: Anchorable) -> [NSLayoutConstraint] {
  left.equalConstraints(to: right)
}

#if os(iOS)
func + (left: EdgesAnchor, right: UIEdgeInsets) -> EdgesAnchor {
  left.withConstant(right)
}

func - (left: EdgesAnchor, right: UIEdgeInsets) -> EdgesAnchor {
  left + right.inverted()
}
#elseif os(macOS)
func + (left: EdgesAnchor, right: NSEdgeInsets) -> EdgesAnchor {
  left.withConstant(right)
}

func - (left: EdgesAnchor, right: NSEdgeInsets) -> EdgesAnchor {
  left + right.inverted()
}
#endif

func + (left: EdgesAnchor, right: CGFloat) -> EdgesAnchor {
  left + .constant(right)
}

func - (left: EdgesAnchor, right: CGFloat) -> EdgesAnchor {
  left + -right
}

#if os(iOS)
private extension UIEdgeInsets {
  func inverted() -> UIEdgeInsets {
    UIEdgeInsets(top: -top, left: -left, bottom: -bottom, right: -right)
  }

  static func constant(_ constant: CGFloat) -> UIEdgeInsets {
    UIEdgeInsets(top: constant, left: constant, bottom: constant, right: constant)
  }
}
#elseif os(macOS)
private extension NSEdgeInsets {
  func inverted() -> NSEdgeInsets {
    NSEdgeInsets(top: -top, left: -left, bottom: -bottom, right: -right)
  }

  static let zero: NSEdgeInsets = NSEdgeInsetsZero

  static func constant(_ constant: CGFloat) -> NSEdgeInsets {
    NSEdgeInsets(top: constant, left: constant, bottom: constant, right: constant)
  }
}
#endif

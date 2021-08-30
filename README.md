# EquationLayout

Define AutoLayout constraints with equations and inequalities. Inspired by [Stevia](https://github.com/freshOS/Stevia).

WARNING: This package is for experimental purpose only. It is not designed for production use.

## Documentation

Use equations to create `NSLayoutConstant`. EquationLayout supports both UIKit and AppKit. It works for `UIView`, `UILayoutGuide`, `NSView` and `NSLayoutGuide`.

```swift
NSLayoutConstant.activate([
  label.centerX == view.centerX,
  label.top == view.top,
])
```

### Horizontal and vertical constraints

```swift
label.top == view.top // Equivalent to label.topAnchor.constraint(equalTo: view.topAnchor)
label.leading == view.leading + 8 // constant
label.trailing == view.trailing - 8
label.bottom <= view.bottom // lessThanOrEqual
```

### Width and Height

```swift
imageView.width * 3 == view.width
imageView.width / 16 == imageView.height / 9 // Aspect ratio
view.height >= imageView.height // greaterThanOrEqual
```

### Edges

`edges()` is a convient way to embed a view inside another view.

```swift
imageView.edges() + 8 == view // top, leading, bottom, trailing constrants with 8px insets
imageView.edges([.top, .leading, .bottom]) + 8 == view // Selected edges
imageView.edges() + UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8) == view // Different constants for each edge
```

# UIViewWrapper for SwiftUI

A helper for using `UIKit` UIViews in `SwiftUI`.

The wrapper uses iOS 16+ APIs to size the UIKit view using auto layout constraints correctly. 

It also supports animating the `UIView` using SwiftUI animation modifiers.

### Example usage

```swift
struct MyView: View {
    @State private var text: String = "Hello world"

    var body: some View {
        UIViewWrapper<UILabel> {
            // Initialize the view once
            let label = UILabel()
            label.numberOfLines = 0
            return label
        } update: { label in
            // Update the view on re-draw
            label.text = text
        }
    }
}
```

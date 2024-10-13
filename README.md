# UIViewWrapper for SwiftUI

A helper for using `UIKit` UIViews in `SwiftUI`.

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

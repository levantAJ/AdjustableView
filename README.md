[![Pod Version](https://cocoapod-badges.herokuapp.com/v/AdjustableView/badge.png)](http://cocoadocs.org/docsets/AdjustableView/)
[![Pod Platform](https://cocoapod-badges.herokuapp.com/p/AdjustableView/badge.png)](http://cocoadocs.org/docsets/AdjustableView/)
[![Pod License](https://cocoapod-badges.herokuapp.com/l/AdjustableView/badge.png)](https://www.apache.org/licenses/LICENSE-2.0.html)

# AdjustableView
Draggable &amp; Resizable UIView at the same time

![giphy](https://user-images.githubusercontent.com/6329656/96358951-1057e000-1137-11eb-83b1-a3f6f855db50.gif)

## Requirements

- iOS 9.0 or later
- Xcode 11.0 or later

## Install

### Installation with CocoaPods

```ruby
pod 'AdjustableView', '1.0'
```

### Build Project

At this point your workspace should build without error. If you are having problem, post to the Issue and the
community can help you solve it.

## How to use:

```swift
import AdjustableView
```

```swift
class YourView: AdjustableView {
}
```

#### Notify the event changed:

```swift
yourView.onDragingStarted = {}
yourView.onFrameChanged = {}
yourView.onDragingEnded = {}
```

## Author
- [Tai Le](https://github.com/levantAJ)

## Communication
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.


## Licenses

All source code is licensed under the [MIT License](https://raw.githubusercontent.com/levantAJ/AdjustableView/master/LICENSE).


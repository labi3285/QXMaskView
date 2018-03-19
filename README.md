# QXMaskView
A easy use and customize mask view shower.

### install
```
pod search QXMaskView
```

### how to use?
![](https://github.com/labi3285/QXMaskView/blob/master/screen.png)
```objc
extension DemoView: QXMaskViewContentViewProtocol {
    func qxMaskViewContentViewFrame(for maskViewFrame: CGRect) -> CGRect {
        return CGRect(x: 0, y: maskViewFrame.height - 200, width: maskViewFrame.width, height: 200)
    }
    func qxMaskViewContentViewPrepareCancelContext(handler: @escaping (() -> ())) {
        self.respondCancel = handler
    }
}

```

```objc
let view = DemoView()
QXMaskViewController.makeupAndPresent(contentView: view, onVc: self)
```
Have fun!

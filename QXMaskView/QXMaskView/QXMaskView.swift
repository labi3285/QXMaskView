//
//  QXMaskView.swift
//  QXMaskViewControllerDemo
//
//  Created by labi3285 on 2018/3/19.
//  Copyright © 2018年 labi3285. All rights reserved.
//

import UIKit

/**
 * 蒙版内容所需要遵循的协议
 */
public protocol QXMaskViewContentViewProtocol {
    /**
     * 尺寸自适应
     */
    func qxMaskViewContentViewFrame(for maskViewFrame: CGRect) -> CGRect
    /**
     * 取消的回调响应上下文
     */
    func qxMaskViewContentViewPrepareCancelContext(handler: @escaping (() -> ()))
}

/**
 * 蒙版类主类，一般和QXMaskViewController配合使用，也可以单独使用以实现更自由化的配置
 */
public class QXMaskView: UIButton {
    
    /**
     * 点击背景的回调
     */
    public var respondTouchBackground: (() -> ())?
    
    /**
     * 要展示的内容
     */
    public let contentView: UIView & QXMaskViewContentViewProtocol
    
    /**
     * 点击空白的地方是否隐藏
     */
    public var isCancelOnTouchBackground: Bool = true
    
    /**
     * 构造方法
     */
    public required init(contentView: UIView & QXMaskViewContentViewProtocol) {
        self.contentView = contentView
        super.init(frame: CGRect.zero)
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        addSubview(contentView)
        addTarget(self, action: #selector(QXMaskView.maskViewClick), for: UIControlEvents.touchUpInside)
        contentView.qxMaskViewContentViewPrepareCancelContext { [weak self] in
            self?.respondTouchBackground?()
        }
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.qxMaskViewContentViewFrame(for: frame)
    }
    @objc func maskViewClick() {
        respondTouchBackground?()
    }
}


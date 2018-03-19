//
//  QXMaskViewController.swift
//  QXMaskViewControllerDemo
//
//  Created by labi3285 on 2018/3/19.
//  Copyright © 2018年 labi3285. All rights reserved.
//

import UIKit

extension QXMaskViewController {
    
    /**
     * 初始化并展示
     */
    @discardableResult public class func makeupAndPresent(contentView: UIView & QXMaskViewContentViewProtocol, onVc: UIViewController?) -> QXMaskViewController {
        let maskView = QXMaskView(contentView: contentView)
        weak var vc = QXMaskViewController(maskView: maskView)
        maskView.respondTouchBackground = {
            vc?.dismiss(animated: false, completion: nil)
        }
        onVc?.present(vc!, animated: false, completion: nil)
        return vc!
    }
    
}

/**
 * 用来承载SLMaskView的控制器， 固定present使用，请不要push
 */
public class QXMaskViewController: UIViewController {
    
    /**
     * 蒙层
     */
    public let maskView: QXMaskView
    
    /**
     * 构造方法
     */
    public required init(maskView: QXMaskView) {
        self.maskView = maskView
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.clear
        view.addSubview(maskView)
        modalPresentationStyle = .custom
    }
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        maskView.frame = view.bounds
    }
}

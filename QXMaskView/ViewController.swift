//
//  ViewController.swift
//
//  Created by labi3285 on 2018/3/19.
//  Copyright © 2018年 labi3285. All rights reserved.
//

import UIKit

class DemoView: UILabel {
    
    fileprivate var respondCancel: (() -> ())?
    
    lazy var closeButton: UIButton = {
        let one = UIButton()
        one.setTitle("for close", for: UIControlState.normal)
        one.backgroundColor = UIColor.red
        one.addTarget(self, action: #selector(close), for: .touchUpInside)
        return one
    }()
    @objc func close() {
        respondCancel?()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
        textAlignment = .center
        backgroundColor = UIColor.yellow
        text = "for show!"
        addSubview(closeButton)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        closeButton.frame = CGRect(x: bounds.width - 100, y: 0, width: 100, height: 44)
    }
}

extension DemoView: QXMaskViewContentViewProtocol {
    func qxMaskViewContentViewFrame(for maskViewFrame: CGRect) -> CGRect {
        return CGRect(x: 0, y: maskViewFrame.height - 200, width: maskViewFrame.width, height: 200)
    }
    func qxMaskViewContentViewPrepareCancelContext(handler: @escaping (() -> ())) {
        self.respondCancel = handler
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let view = DemoView()
        QXMaskViewController.makeupAndPresent(contentView: view, onVc: self)
    }
    
}


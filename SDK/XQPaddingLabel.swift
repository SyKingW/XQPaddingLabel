//
//  XQPaddingLabel.swift
//  XQShopMallProject
//
//  Created by WXQ on 2020/4/27.
//  Copyright © 2020 itchen.com. All rights reserved.
//

import UIKit
import SnapKit


public class XQPaddingLabel: UIView {
    
    /// 内容label
    @objc public let label = UILabel()
    
    /// 是否圆角
    @objc public var rounded = true
    
    /// 上下左右j间隔
    private var _padding: UIEdgeInsets = UIEdgeInsets.init(top: 5, left: 10, bottom: -5, right: -10)
    @objc public var padding: UIEdgeInsets {
        set {
            _padding = newValue
            self.label.snp.remakeConstraints { (make) in
                make.top.equalTo(self.padding.top)
                make.left.equalTo(self.padding.left)
                make.right.equalTo(self.padding.right)
                make.bottom.equalTo(self.padding.bottom)
            }
        }
        get {
            return _padding
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    
    @objc public init(frame: CGRect,
         padding: UIEdgeInsets = UIEdgeInsets.init(top: 5, left: 10, bottom: -5, right: -10),
         rounded: Bool = true) {
        super.init(frame: frame)
        self.initUI()
        
        self.padding = padding
        self.rounded = rounded
        
    }
    
    private func initUI() {
        self.addSubview(self.label)
        
        // 布局
        self.label.snp.makeConstraints { (make) in
            make.top.equalTo(self.padding.top)
            make.left.equalTo(self.padding.left)
            make.right.equalTo(self.padding.right)
            make.bottom.equalTo(self.padding.bottom)
        }
        
        // 设置属性
        self.backgroundColor = UIColor.lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if self.rounded {
            self.layer.cornerRadius = self.bounds.height/2
            self.layer.masksToBounds = true
        }
    }
    
}

//
//  CD.swift
//  CD
//
//  Created by Prime on 7/3/18.
//  Copyright © 2018 prime. All rights reserved.
//

import UIKit

class CD: UIView {
    var imageView = UIImageView()
    var holeRadius: CGFloat {
        get {
            return bounds.size.width * 0.08
        }
    }

    init(image: UIImage?) {
        super.init(frame: .zero)

        imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        clipsToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        backgroundColor?.setFill()
        UIRectFill(rect)

        let path = CGMutablePath()

        path.addEllipse(in: CGRect(
            x: bounds.size.width / 2 - holeRadius,
            y: bounds.size.height / 2 - holeRadius,
            width: 2 * holeRadius,
            height: 2 * holeRadius)
        )
        path.addRect(bounds)

        let layer = CAShapeLayer()
        layer.path = path
        layer.fillRule = kCAFillRuleEvenOdd
        self.layer.mask = layer
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = frame.size.width / 2
    }
}

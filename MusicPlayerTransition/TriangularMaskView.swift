//
//  TriangularMaskView.swift
//  MusicPlayerTransition
//
//  Created by Jimmy Lee on 2018/7/11.
//  Copyright © 2018 Prime. All rights reserved.
//

import UIKit

class TriangularMaskView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        commonInit()
    }

    private func commonInit() {
        let size = UIScreen.main.bounds.size
        let triangularPath = UIBezierPath()
        triangularPath.move(to: .zero)
        triangularPath.addLine(to: CGPoint(x: size.width, y: 0))
        triangularPath.addLine(to: CGPoint(x: size.width, y: size.height))
        triangularPath.close()

        let triangularMaskLayer = CAShapeLayer()
        triangularMaskLayer.path = triangularPath.cgPath

        backgroundColor = UIColor(white: 1.0/16.0, alpha: 1)
        layer.mask = triangularMaskLayer
    }
}

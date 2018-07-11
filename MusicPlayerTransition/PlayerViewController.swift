//
//  PlayerViewController.swift
//  MusicPlayerTransition
//
//  Created by Jimmy Lee on 2018/7/11.
//  Copyright © 2018 Prime. All rights reserved.
//

import Hero
import SnapKit
import UIKit

class PlayerViewController: UIViewController {
    let triangularMaskView = TriangularMaskView()

    let containerView = UIView()
    let nameLabel = UILabel()
    let artistLabel = UILabel()
    let cd = CD(image: UIImage(named: "OneMoreLight.jpg"))

    let repeatButton = UIButton(type: .custom)
    let goPrevButton = UIButton(type: .custom)
    let goNextButton = UIButton(type: .custom)
    let shuffleButton = UIButton(type: .custom)
    var stackView = UIStackView()

    var animator = UIDynamicAnimator(referenceView: UIView())
    let dynamicItemBehavior = UIDynamicItemBehavior()

    override func viewDidLoad() {
        super.viewDidLoad()

        createView()
        createConstraint()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        setUpDynamics()
    }

    private func createView() {
        hero.isEnabled = true

        view.backgroundColor = .black
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))

        triangularMaskView.hero.id = Hero.triangularMask
        view.addSubview(triangularMaskView)

        cd.hero.id = Hero.cover
        view.addSubview(cd)

        view.addSubview(containerView)

        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        nameLabel.text = "One More Light"
        nameLabel.hero.id = Hero.name
        containerView.addSubview(nameLabel)

        artistLabel.textColor = .lightGray
        artistLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        artistLabel.text = "Linkin Park"
        artistLabel.hero.id = Hero.artist
        containerView.addSubview(artistLabel)

        repeatButton.setImage(UIImage(named: "ic_repeat_white"), for: .normal)
        goPrevButton.setImage(UIImage(named: "ic_skip_previous_white"), for: .normal)
        goNextButton.setImage(UIImage(named: "ic_skip_next_white"), for: .normal)
        shuffleButton.setImage(UIImage(named: "ic_shuffle_white"), for: .normal)

        stackView = UIStackView(arrangedSubviews: [repeatButton, goPrevButton, goNextButton, shuffleButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.hero.modifiers = [.translate(CGPoint(x: 0, y: 100))]

        view.addSubview(stackView)
    }

    private func createConstraint() {
        triangularMaskView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        cd.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(300)
        }

        containerView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }

        nameLabel.snp.makeConstraints { (make) in
            make.top.bottom.left.equalToSuperview()
        }

        artistLabel.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel.snp.right).offset(8)
            make.top.bottom.right.equalToSuperview()
        }

        stackView.snp.makeConstraints { (make) in
            make.left.right.equalTo(cd)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(60)
        }
    }

    private func setUpDynamics() {
        animator = UIDynamicAnimator(referenceView: view)
        dynamicItemBehavior.angularResistance = 0
        dynamicItemBehavior.addItem(cd)
        animator.addBehavior(dynamicItemBehavior)

        dynamicItemBehavior.addAngularVelocity(-dynamicItemBehavior.angularVelocity(for: cd), for: cd)
        dynamicItemBehavior.addAngularVelocity(2, for: cd)
    }

    @objc private func tap() {
        dismiss(animated: true, completion: nil)
    }
}

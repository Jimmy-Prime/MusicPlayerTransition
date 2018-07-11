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
    let containerView = UIView()
    let nameLabel = UILabel()
    let artistLabel = UILabel()
    let cd = CD(image: UIImage(named: "OneMoreLight.jpg"))

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
    }

    private func createConstraint() {
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

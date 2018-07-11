//
//  ListViewController.swift
//  MusicPlayerTransition
//
//  Created by Jimmy Lee on 2018/7/11.
//  Copyright © 2018 Prime. All rights reserved.
//

import Hero
import SnapKit
import UIKit

class ListViewController: UIViewController {
    let triangularMaskView = TriangularMaskView()

    let infoContainerView = UIView()
    let albumCoverImageView = UIImageView()
    let maskContainerView = UIView()
    let nameLabel = UILabel()
    let artistLabel = UILabel()

    var tableViewDataSource = [SongInfo]()
    let tableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()

        createView()
        createConstraint()
    }

    private func createView() {
        view.backgroundColor = .black
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))

        triangularMaskView.hero.id = Hero.triangularMask
        view.addSubview(triangularMaskView)

        view.addSubview(infoContainerView)

        albumCoverImageView.image = UIImage(named: "OneMoreLight.jpg")
        albumCoverImageView.contentMode = .scaleAspectFill
        albumCoverImageView.clipsToBounds = true
        albumCoverImageView.hero.id = Hero.cover
        infoContainerView.addSubview(albumCoverImageView)

        maskContainerView.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        infoContainerView.addSubview(maskContainerView)

        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        nameLabel.text = "One More Light"
        nameLabel.hero.id = Hero.name
        maskContainerView.addSubview(nameLabel)

        artistLabel.textColor = .lightGray
        artistLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        artistLabel.text = "Linkin Park"
        artistLabel.hero.id = Hero.artist
        maskContainerView.addSubview(artistLabel)

        setUpTableView()
    }

    private func createConstraint() {
        triangularMaskView.snp.makeConstraints { (make) in
            make.left.right.height.equalToSuperview()
            make.centerY.equalTo(infoContainerView.snp.bottom)
        }

        infoContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
        }

        albumCoverImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(albumCoverImageView.snp.width).multipliedBy(10.0/16.0)
        }

        maskContainerView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(44)
        }

        nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(8)
            make.left.equalToSuperview().offset(15)
        }

        artistLabel.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel.snp.right).offset(8)
            make.centerY.equalTo(nameLabel.snp.centerY)
        }

        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(infoContainerView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    @objc private func tap() {
        tableView.hero.modifiers = [.cascade(delta: 0, direction: .bottomToTop, delayMatchedViews: false)]

        for (index, cell) in tableView.visibleCells.enumerated() {
            cell.hero.modifiers = [.duration(0.125 * Double(index)), .translate(CGPoint.init(x: 0, y: 90)), .fade]
        }

        present(PlayerViewController(), animated: true, completion: nil)
    }
}

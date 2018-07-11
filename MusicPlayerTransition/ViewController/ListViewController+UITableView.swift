//
//  ListViewController+UITableView.swift
//  MusicPlayerTransition
//
//  Created by Jimmy Lee on 2018/7/11.
//  Copyright © 2018 Prime. All rights reserved.
//

import UIKit

extension ListViewController {
    func setUpTableView() {
        setUpDataSource()

        tableView.register(ListTableViewCell.nib(), forCellReuseIdentifier: ListTableViewCell.identifier())
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 2
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }

    private func setUpDataSource() {
        tableViewDataSource.append(SongInfo(coverName: "HybridTheory.jpg", songName: "In The End", albumName: "Hybrid Theory"))
        tableViewDataSource.append(SongInfo(coverName: "HybridTheory.jpg", songName: "Crawling", albumName: "Hybrid Theory"))

        tableViewDataSource.append(SongInfo(coverName: "Meteora.jpg", songName: "Somewhere I Belong", albumName: "Meteora"))
        tableViewDataSource.append(SongInfo(coverName: "Meteora.jpg", songName: "Easier To Run", albumName: "Meteora"))
        tableViewDataSource.append(SongInfo(coverName: "Meteora.jpg", songName: "Breaking The Habbit", albumName: "Meteora"))
        tableViewDataSource.append(SongInfo(coverName: "Meteora.jpg", songName: "Numb", albumName: "Meteora"))

        tableViewDataSource.append(SongInfo(coverName: "MinutesToMidnight.jpg", songName: "Bleed It Out", albumName: "Minutes To Midnight"))
        tableViewDataSource.append(SongInfo(coverName: "MinutesToMidnight.jpg", songName: "Shadow Of The Day", albumName: "Minutes To Midnight"))
        tableViewDataSource.append(SongInfo(coverName: "MinutesToMidnight.jpg", songName: "What I've Done", albumName: "Minutes To Midnight"))
        tableViewDataSource.append(SongInfo(coverName: "MinutesToMidnight.jpg", songName: "Hands Held High", albumName: "Minutes To Midnight"))
        tableViewDataSource.append(SongInfo(coverName: "MinutesToMidnight.jpg", songName: "No More Sorrow", albumName: "Minutes To Midnight"))
        tableViewDataSource.append(SongInfo(coverName: "MinutesToMidnight.jpg", songName: "Valentine's Day", albumName: "Minutes To Midnight"))

        tableViewDataSource.append(SongInfo(coverName: "AThousandSuns.jpg", songName: "Burning In The Sky", albumName: "A Thousand Suns"))
        tableViewDataSource.append(SongInfo(coverName: "AThousandSuns.jpg", songName: "Robot Boy", albumName: "A Thousand Suns"))
        tableViewDataSource.append(SongInfo(coverName: "AThousandSuns.jpg", songName: "Waiting For The End", albumName: "A Thousand Suns"))
        tableViewDataSource.append(SongInfo(coverName: "AThousandSuns.jpg", songName: "Iridescent", albumName: "A Thousand Suns"))
        tableViewDataSource.append(SongInfo(coverName: "AThousandSuns.jpg", songName: "The Catalyst", albumName: "A Thousand Suns"))
        tableViewDataSource.append(SongInfo(coverName: "AThousandSuns.jpg", songName: "The Messenger", albumName: "A Thousand Suns"))
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewDataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier(), for: indexPath) as! ListTableViewCell
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear

        let info = tableViewDataSource[indexPath.row]
        cell.coverImageView.image = UIImage(named: info.coverName)
        cell.songNameLabel.text = info.songName
        cell.albumNameLabel.text = info.albumName

        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

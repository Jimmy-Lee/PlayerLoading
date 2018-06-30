//
//  InitialViewController.swift
//  player
//
//  Created by Prime on 6/30/18.
//  Copyright © 2018 prime. All rights reserved.
//

import Hero
import SnapKit
import UIKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .background

        let yOffset = 0.128 * UIScreen.main.bounds.size.height

        let yDiff: CGFloat = 86
        let xOffset = 215

        let connection = UIImageView(image: UIImage(named: "connection.png")?.withRenderingMode(.alwaysTemplate))
        connection.hero.id = Hero.connection
        connection.hero.modifiers = [.delay(Time.delay), .fade]
        connection.tintColor = .theme
        view.addSubview(connection)
        connection.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(yOffset)
        }

        let left = UIImageView(image: UIImage(named: "side.png")?.withRenderingMode(.alwaysTemplate))
        left.hero.id = Hero.left
        left.tintColor = .theme
        view.addSubview(left)
        left.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-xOffset)
            make.centerY.equalToSuperview().offset(yOffset + yDiff)
        }
        left.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180 * 164)

        let right = UIImageView(image: UIImage(named: "side.png")?.withRenderingMode(.alwaysTemplate))
        right.hero.id = Hero.right
        right.tintColor = .theme
        view.addSubview(right)
        right.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(xOffset)
            make.centerY.equalToSuperview().offset(yOffset + yDiff)
        }
        right.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180 * 16)

        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
    }

    @objc func tap() {
        present(LoadingViewController(), animated: true)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

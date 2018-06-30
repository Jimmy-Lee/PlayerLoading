//
//  LoadingViewController.swift
//  player
//
//  Created by Prime on 7/1/18.
//  Copyright © 2018 prime. All rights reserved.
//

import Hero
import NVActivityIndicatorView
import UIKit

class LoadingViewController: UIViewController {
    let container = UIView()
    let activityIndicator = NVActivityIndicatorView(frame: .zero, type: .lineScalePulseOut, color: .theme)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .background

        self.hero.isEnabled = true

        let xOffset = 0.1 * UIScreen.main.bounds.size.width

        let left = UIImageView(image: UIImage(named: "sideLarge.png")?.withRenderingMode(.alwaysTemplate))
        left.hero.id = Hero.left
        left.hero.modifiers = [.delay(Time.delay)]
        left.tintColor = .theme
        view.addSubview(left)
        left.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(xOffset)
            make.centerY.equalToSuperview()
        }
        left.transform = CGAffineTransform(rotationAngle: CGFloat.pi)

        let right = UIImageView(image: UIImage(named: "sideLarge.png")?.withRenderingMode(.alwaysTemplate))
        right.hero.id = Hero.right
        right.hero.modifiers = [.delay(Time.delay)]
        right.tintColor = .theme
        view.addSubview(right)
        right.snp.makeConstraints { (make) in
            make.right.equalToSuperview().inset(xOffset)
            make.centerY.equalToSuperview()
        }

        container.alpha = 0
        view.addSubview(container)
        container.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }

        container.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
            make.width.height.equalTo(28)
        }

        let label = UILabel()
        label.textColor = .theme
        label.text = "Loading..."
        container.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.left.equalTo(activityIndicator.snp.right).offset(20)
        }

        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        container.alpha = 1
        activityIndicator.startAnimating()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        container.alpha = 0
        activityIndicator.stopAnimating()
    }

    @objc func tap() {
        dismiss(animated: true)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

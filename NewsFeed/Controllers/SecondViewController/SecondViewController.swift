//
//  SecondViewController.swift
//  NewsFeed
//
//  Created by Artem Mazur on 6/3/22.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    var coordinator: Coordinator?
    
    private lazy var backToMainVCButton: UIButton = {
        let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.backgroundColor = .red
        backButton.titleLabel?.textColor = .white
        backButton.titleLabel?.text = "Tap me"
        backButton.layer.cornerRadius = 10
        backButton.addTarget(self, action: #selector(presentMainController), for: .touchUpInside)
        return backButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupConstaints()
    }
    
    func setupConstaints() {
        backToMainVCButton.snp.makeConstraints { make in
            make.center.equalTo(self.view)
            make.width.height.equalTo(150)
        }
    }
    
    func setupUI() {
        self.view.addSubview(backToMainVCButton)
    }
    
    @objc func presentMainController() {
        self.coordinator?.eventHappended(with: .openMainController)
    }

}

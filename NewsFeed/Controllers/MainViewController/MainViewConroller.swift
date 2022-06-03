//
//  MainViewConroller.swift
//  NewsFeed
//
//  Created by Artem Mazur on 6/3/22.
//

import UIKit
import SnapKit

class MainViewConroller: UIViewController {
    
    var coordinator: Coordinator?
    
    private lazy var goToSecondVCButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.titleLabel?.text = "hello"
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(presentSecondController), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .orange
        self.setupUI()
        self.setupConstaints()
    }
    
    func setupConstaints() {
        goToSecondVCButton.snp.makeConstraints { make in
            make.center.equalTo(self.view)
            make.width.height.equalTo(150)
        }
    }
    
    func setupUI() {
        self.view.addSubview(goToSecondVCButton)
    }
    
    @objc func presentSecondController() {
        self.coordinator?.eventHappended(with: .openSecondController)
    }


}


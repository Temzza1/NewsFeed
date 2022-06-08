//
//  MainViewConroller.swift
//  NewsFeed
//
//  Created by Artem Mazur on 6/3/22.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class MainViewConroller: UIViewController {
    
    var coordinator: Coordinator?
    let viewModel = MainViewModel()
    var disposeBag = DisposeBag()
    
    private lazy var newsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("News", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.rx.tap.bind {
            print("hello")
//            self.moveToTopicTapped(to: .news)
        }.disposed(by: disposeBag)
        return button
    }()
    
    private lazy var worldButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("World", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.rx.tap.bind {
            print("hello")
//            self.moveToTopicTapped(to: .world)
        }.disposed(by: disposeBag)
        return button
    }()
    
    private lazy var techButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Tech", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.rx.tap.bind {
            print("hello")
//            self.moveToTopicTapped(to: .tech)
        }.disposed(by: disposeBag)
        return button
    }()
    
    private lazy var politicsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Politics", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    private lazy var economicButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Economic", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    private lazy var gamingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Gaming", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    private lazy var categoryScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .lightGray
        scrollView.isScrollEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: 510, height: 0)
        scrollView.addSubview(newsButton)
        scrollView.addSubview(worldButton)
        scrollView.addSubview(techButton)
        scrollView.addSubview(politicsButton)
        scrollView.addSubview(economicButton)
        scrollView.addSubview(gamingButton)
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.setupUI()
        self.setupConstaints()
    }
    
    func setupConstaints() {
        let offset = 20
        categoryScrollView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(view).offset(50)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
        }
        
        newsButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(offset)
            make.bottom.equalToSuperview().offset(42.5)
            make.width.equalTo(70)
        }
        
        worldButton.snp.makeConstraints { make in
            make.left.equalTo(newsButton.snp_rightMargin).offset(offset)
            make.bottom.equalToSuperview().offset(42.5)
            make.width.equalTo(70)
        }
        
        techButton.snp.makeConstraints { make in
            make.left.equalTo(worldButton.snp_rightMargin).offset(offset)
            make.bottom.equalToSuperview().offset(42.5)
            make.width.equalTo(70)
        }
        
        politicsButton.snp.makeConstraints { make in
            make.left.equalTo(techButton.snp_rightMargin).offset(offset)
            make.bottom.equalToSuperview().offset(42.5)
            make.width.equalTo(70)
        }
        
        economicButton.snp.makeConstraints { make in
            make.left.equalTo(politicsButton.snp_rightMargin).offset(offset)
            make.bottom.equalToSuperview().offset(42.5)
            make.width.greaterThanOrEqualTo(75)
        }
        
        gamingButton.snp.makeConstraints { make in
            make.left.equalTo(economicButton.snp_rightMargin).offset(offset)
            make.right.equalTo(categoryScrollView.snp_rightMargin).offset(-offset)
            make.bottom.equalToSuperview().offset(42.5)
            make.width.equalTo(70)
        }
    }
    
    func setupUI() {
        view.addSubview(categoryScrollView)
    }
    
    func moveToTopicTapped(to topic: NewsTopic) {
        viewModel.fetchNews(with: "Apple",topic: topic)
//        self.coordinator?.eventHappended(with: .openSecondController)
    }


}


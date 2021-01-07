//
//  ViewController.swift
//  onboarding-travel-app
//
//  Created by Сергей Голенко on 06.01.2021.
//

import UIKit

class OnboardingViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var darkView: UIView!
    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    //MARK: - variables
    private var currentPage: Int = 0
    private var items : [OnboardingItem] = []
    
    //MARK: - functions
    private func setupPlaceholderItems(){
        items = OnboardingItem.placeholderItems
    }
    
    private func isOverLastItem() -> Bool {
        return currentPage == self.items.count
    }
    
    private func setupPageControl(){
        pageControll.numberOfPages = items.count
    }
    
    private func setupScreen(index:Int){
        titleLabel.text = items[index].title
        detailLabel.text = items[index].detail
        bgImageView.image = items[index].bgImage
        pageControll.currentPage = index
        self.titleLabel.alpha = 1.0
        self.detailLabel.alpha = 1.0
        self.titleLabel.transform = .identity
        self.detailLabel.transform = .identity
        currentPage += 1
    }
    
    private func setupGestures(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapAnimation))
        view.addGestureRecognizer(tap)
    }
    
    private func mainApp(){
        let mainAppViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "appMain")
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate,
           let window = sceneDelegate.window{
            window.rootViewController = mainAppViewController
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
    
    private func setupView(){
        darkView.backgroundColor = UIColor.init(white: 0.1, alpha: 0.5)
    }
    
    @objc private func handleTapAnimation(){
        // first animation - title label
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut,animations: {
            self.titleLabel.alpha = 0.5
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options:.curveEaseInOut,animations: {
                self.titleLabel.alpha = 0
                self.titleLabel.transform = CGAffineTransform(translationX: 0, y: -550)
            }, completion: nil)
        }
        // second animation - detail label
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations:{
            self.detailLabel.alpha = 0.5
            self.detailLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { _ in
            
            UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations:{
                            self.detailLabel.alpha = 0
                            self.detailLabel.transform = CGAffineTransform(translationX: 0, y: -550)
            }){ _ in
                
                if self.isOverLastItem(){
                    self.mainApp()
                
                } else {
                    self.setupScreen(index: self.currentPage)
            }
        }
      }
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlaceholderItems()
        setupPageControl()
        setupScreen(index: currentPage)
        setupGestures()
        setupView()

    }

}


//
//  ViewController.swift
//  onboarding-travel-app
//
//  Created by Сергей Голенко on 06.01.2021.
//

import UIKit



struct OnboardingItem {
    let title: String
    let detail: String
    let bgImage: UIImage?
}



class ViewController: UIViewController {
    

    
    //MARK: - Outlets
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var darkView: UIView!
    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    //MARK: - variables
    
    
    private let currentPage: Int = 0
    
    private var items : [OnboardingItem] = [.init(title: "Travel Your Way", detail: "Travel the world by air, rail or sea at the most competitve prices", bgImage: nil),.init(title: "Stay Your Way", detail: "With over millions of hotels worldwide,find the perfect accomodation in the most amazing placed", bgImage: nil),.init(title: "Discover Your Way With New Feature", detail: "Explore exotic destinations with our new features that link you to like-minded travellers!", bgImage: nil),.init(title: "Feast Your Way", detail: "We recommend you local cuisines that are safe and highly recommended by the locals!", bgImage: nil)]
    
    
    
    //MARK: - functions
    
    private func setupPageControl(){
        pageControll.numberOfPages = items.count
    }
    
    private func setupScreen(index:Int){
        titleLabel.text = items[index].title
        detailLabel.text = items[index].detail
        pageControll.currentPage = index
    }
    
    private func setupGestures(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapAnimation))
        view.addGestureRecognizer(tap)
    }
    
    
    @objc private func handleTapAnimation(){
        print("tap")
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageControl()
        setupScreen(index: currentPage)
        setupGestures()
       
    }


}


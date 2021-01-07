//
//  OnboardingItem.swift
//  onboarding-travel-app
//
//  Created by Сергей Голенко on 07.01.2021.
//

import UIKit

struct OnboardingItem {
    let title: String
    let detail: String
    let bgImage: UIImage?
    
    static let placeholderItems : [OnboardingItem] = [.init(title: "Travel Your Way", detail: "Travel the world by air, rail or sea at the most competitve prices", bgImage: UIImage(named: "travel1")),.init(title: "Stay Your Way", detail: "With over millions of hotels worldwide,find the perfect accomodation in the most amazing placed", bgImage: UIImage(named: "travel2")),.init(title: "Discover Your Way With New Feature", detail: "Explore exotic destinations with our new features that link you to like-minded travellers!", bgImage:UIImage(named: "travel3")),.init(title: "Feast Your Way", detail: "We recommend you local cuisines that are safe and highly recommended by the locals!", bgImage:UIImage(named: "travel4"))]
    
}




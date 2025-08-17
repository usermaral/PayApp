//
//  ViewController.swift
//  PayApp
//
//  Created by Maral Tazebayeva on 08.08.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Main")
        setCircle()
    }
    
    private func setCircle() {
        let circle1 = createCircle(frame: CGRect(x: view.frame.width - 74, y: -28, width: 100, height: 100))
        let circle2 = createCircle(frame: CGRect(x: 83, y: 100, width: 67, height: 67))
        let circle3 = createCircle(frame: CGRect(x: view.frame.width - 201, y: 216, width: 286, height: 286))
        let circle4 = createCircle(frame: CGRect(x: 83, y: view.frame.height - 272, width: 56, height: 56))
        let circle5 = createCircle(frame: CGRect(x: view.frame.width - 121, y: view.frame.height - 120, width: 97, height: 97))
        let circle6 = createCircle(frame: CGRect(x: -10, y: view.frame.height - 115, width: 140, height: 140))
        
        [circle1, circle2, circle3, circle4, circle5, circle6].forEach { item in
            view.addSubview(item)
        }
    }
    
    private func createCircle(frame: CGRect) -> UIView {
        let circle = UIView()
        circle.backgroundColor = UIColor(named: "Circle")
        circle.frame = frame
        circle.layer.cornerRadius = frame.width / 2
        return circle
    }


}


//
//  ViewController.swift
//  PayApp
//
//  Created by Maral Tazebayeva on 08.08.2025.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var textStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "img1")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
        image.widthAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Main")
        setCircle()
        setImage()
        setText()
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
    
    private func setImage() {
        view.addSubview(image)
        image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setText() {
        view.addSubview(textStack)
        
        let pageTitle = createLabel(size: 27, weight: .bold, text: "Қосымша және оның барлық қызметтері тегін")
        let pageSubtitle = createLabel(size: 16, weight: .regular, text: "барлық қаражат жобаны жақсартуға және қолдауға жұмсалады")
        
        textStack.addArrangedSubview(pageTitle)
        textStack.addArrangedSubview(pageSubtitle)
        
        NSLayoutConstraint.activate([
            textStack.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 25),
            textStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func createCircle(frame: CGRect) -> UIView {
        let circle = UIView()
        circle.backgroundColor = UIColor(named: "Circle")
        circle.frame = frame
        circle.layer.cornerRadius = frame.width / 2
        return circle
    }

    private func createLabel(size: CGFloat, weight: UIFont.Weight, text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        
        return label
    }

}


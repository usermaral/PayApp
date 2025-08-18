//
//  ViewController.swift
//  PayApp
//
//  Created by Maral Tazebayeva on 08.08.2025.
//

import UIKit

enum PayVariant: Int, CaseIterable {
    case small = 200
    case middle = 400
    case big = 600
}

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
    
    private lazy var payButton: UIButton = {
        let button = UIButton(primaryAction: payButtonAction)
        button.setTitle("Қолдау", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(named: "Blue")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 51).isActive = true
        
        
        return button
    }()
    
    private lazy var payButtonAction = UIAction { _ in
        print(self.selectPrice)
    }
    
    private var selectPrice = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Main")
        setCircle()
        setImage()
        setText()
        setVariants()
        setButton()
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
    
    private func setVariants() {
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.spacing = 0
        hStack.distribution = .equalSpacing
        hStack.alignment = .center
        hStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(hStack)
        
        PayVariant.allCases.forEach { variant in
            hStack.addArrangedSubview(createPayVariant(variant: variant))
        }
        
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: textStack.bottomAnchor, constant: 60),
            hStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            hStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
    }
    
    private func setButton() {
        view.addSubview(payButton)
        
        NSLayoutConstraint.activate([
            payButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            payButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            payButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    @objc func selectVariant(sender: UIGestureRecognizer) {
        PayVariant.allCases.forEach { variant in
            if let sView = self.view.viewWithTag(variant.rawValue) {
                sView.layer.borderWidth = 0
                sView.layer.borderColor = .none
            }
            
            if let selectTag = sender.view?.tag {
                if let selectedView = self.view.viewWithTag(selectTag) {
                    selectedView.layer.borderWidth = 3
                    selectedView.layer.borderColor = UIColor.white.cgColor
                    self.selectPrice = selectTag
                }
            }
        }
    }
    
    private func createPayVariant(variant: PayVariant) -> UIView {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectVariant(sender: )))
        
        let payView = UIView()
        payView.translatesAutoresizingMaskIntoConstraints = false
        payView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        payView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        payView.layer.cornerRadius = 20
        payView.tag = variant.rawValue
        payView.addGestureRecognizer(tapGesture)
        
        switch variant {
        case .small:
            payView.backgroundColor = UIColor(named: "Yellow")
            payView.layer.borderWidth = 3
            payView.layer.borderColor = UIColor.white.cgColor
        case .middle:
            payView.backgroundColor = UIColor(named: "Pink")
        case .big:
            payView.backgroundColor = UIColor(named: "Blue")
        }
        
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = 0
        vStack.alignment = .center
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        let sumLabel = createLabel(size: 31, weight: .bold, text: "\(variant.rawValue)")
        let sumDescription = createLabel(size: 16, weight: .light, text: "теңге")
        
        vStack.addArrangedSubview(sumLabel)
        vStack.addArrangedSubview(sumDescription)
        
        payView.addSubview(vStack)
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: payView.topAnchor, constant: 23),
            vStack.bottomAnchor.constraint(equalTo: payView.bottomAnchor, constant: -23),
            vStack.leadingAnchor.constraint(equalTo: payView.leadingAnchor, constant: 10),
            vStack.trailingAnchor.constraint(equalTo: payView.trailingAnchor, constant: -10),
        ])
        
        return payView
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


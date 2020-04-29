//
//  ViewController.swift
//  assigment1
//
//  Created by Carlos Camacho on 2020-04-27.
//  Copyright © 2020 Carlos Camacho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let mainView: UIView = {
        let main = UIView()
        // important when setting contraints programmatically
        main.translatesAutoresizingMaskIntoConstraints = false
        main.backgroundColor = .green
        return main
    }()
    
    let squareButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Square", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
        return butt
    }()
    
    let portraitButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Portrait", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
        return butt
    }()
    
    let landScapeButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Landscape", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
        return butt
    }()
    
    var widthAnchor: NSLayoutConstraint?
    var heightAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainView)
        setupLayout()
        setPurple()
        setBlue()
        setRed()
        
    }
    
    fileprivate func setupLayout() {
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
        widthAnchor?.isActive = true
        
        heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
        heightAnchor?.isActive = true
        
        let buttStackView = UIStackView(arrangedSubviews: [
            squareButton, portraitButton, landScapeButton])
        buttStackView.translatesAutoresizingMaskIntoConstraints = false
        buttStackView.axis = .horizontal
        buttStackView.alignment = .center
        buttStackView.distribution = .fillEqually
        
        view.addSubview(buttStackView)
        NSLayoutConstraint.activate([
            buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttStackView.heightAnchor.constraint(equalToConstant: 50),
            buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
    }
    
    @objc private func squareTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func portraitTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc private func landscapeTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
    fileprivate func setBlue(){
        let Box1 = UIView(frame: CGRect.zero)
        let Box2 = UIView(frame: CGRect.zero)
        let Box3 = UIView(frame: CGRect.zero)
        let bottom = UIView(frame: CGRect.zero)
        let top = UIView(frame: CGRect.zero)
        
        let stack = UIStackView(arrangedSubviews: [top, Box1, Box2, Box3, bottom])
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        
        //set the boxes
        Box1.translatesAutoresizingMaskIntoConstraints = false
        Box1.backgroundColor = .blue
        Box1.widthAnchor.constraint(equalToConstant: 60).isActive = true
        Box1.heightAnchor.constraint(equalTo: Box1.widthAnchor, multiplier: 1).isActive = true
        Box2.translatesAutoresizingMaskIntoConstraints = false
        Box2.backgroundColor = .blue
        Box2.widthAnchor.constraint(equalToConstant: 60).isActive = true
        Box2.heightAnchor.constraint(equalTo: Box2.widthAnchor, multiplier: 1).isActive = true
        Box3.translatesAutoresizingMaskIntoConstraints = false
        Box3.backgroundColor = .blue
        Box3.widthAnchor.constraint(equalToConstant: 60).isActive = true
        Box3.heightAnchor.constraint(equalTo: Box3.widthAnchor, multiplier: 1).isActive = true
        
        bottom.translatesAutoresizingMaskIntoConstraints = false
        top.translatesAutoresizingMaskIntoConstraints = false
        
        mainView.addSubview(stack)
        
        stack.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        stack.heightAnchor.constraint(equalTo: mainView.heightAnchor).isActive = true
    }
    fileprivate func setRed(){
        let margin: CGFloat = 10.0
        let redBox = UIView(frame: CGRect.zero)
        redBox.translatesAutoresizingMaskIntoConstraints = false
        redBox.backgroundColor = .red
        mainView.addSubview(redBox)
        
        redBox.heightAnchor.constraint(equalToConstant: 40).isActive = true
        redBox.widthAnchor.constraint(equalToConstant: 120).isActive = true
        redBox.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10).isActive = true
        redBox.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10).isActive = true
        
        let Box1 = UIView(frame: CGRect.zero)
        let Box2 = UIView(frame: CGRect.zero)
        Box1.backgroundColor = .orange
        Box2.backgroundColor = .orange
        Box1.translatesAutoresizingMaskIntoConstraints = false
        Box2.translatesAutoresizingMaskIntoConstraints = false
        
        redBox.addSubview(Box1)
        redBox.addSubview(Box2)
        
        
        Box1.leadingAnchor.constraint(equalTo: redBox.leadingAnchor, constant: margin).isActive = true
        Box1.topAnchor.constraint(equalTo: redBox.topAnchor, constant: margin).isActive = true
        Box1.bottomAnchor.constraint(equalTo: redBox.bottomAnchor, constant: -margin).isActive = true
        Box1.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        Box2.leadingAnchor.constraint(equalTo: Box1.trailingAnchor, constant: margin).isActive = true
        Box2.topAnchor.constraint(equalTo: redBox.topAnchor, constant: margin).isActive = true
        Box2.bottomAnchor.constraint(equalTo: redBox.bottomAnchor, constant: -margin).isActive = true
        Box2.widthAnchor.constraint(equalToConstant: 44).isActive = true
        Box2.trailingAnchor.constraint(equalTo: redBox.trailingAnchor, constant: -margin).isActive = true
    }
    fileprivate func setPurple() {
        let purpleBox = UIView(frame: CGRect.zero)
        purpleBox.translatesAutoresizingMaskIntoConstraints = false
        purpleBox.backgroundColor = .purple
        mainView.addSubview(purpleBox)
        purpleBox.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -15).isActive = true
        purpleBox.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.5).isActive = true
        purpleBox.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15).isActive = true
        purpleBox.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
        
    }

}

//
//  ViewController.swift
//  HW26
//
//  Created by brubru on 15.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let viewA = CustomView()
    private let viewB = CustomView()
    private let viewC = CustomView()
    private let viewD = CustomView()
    private let viewE = CustomView()
    
    private let labelOne = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupView()
        setupLabel()
        addSubViews()
        addDelegate()
        addLabels()
        
        setupLayout()
    }
}

private extension ViewController {
    func addSubViews() {
        view.addSubview(viewA)
        
        viewA.addSubview(viewB)
        viewA.addSubview(viewC)
        viewB.addSubview(viewD)
        viewC.addSubview(viewE)
        
        view.addSubview(labelOne)
    }
    
    func addDelegate() {
        viewA.delegateView = self
        viewB.delegateView = self
        viewC.delegateView = self
        viewD.delegateView = self
        viewE.delegateView = self
    }
    
    func setupView() {
        viewA.nameInstance = "A"
        viewB.nameInstance = "B"
        viewC.nameInstance = "C"
        viewD.nameInstance = "D"
        viewE.nameInstance = "E"
    }
    
    func setupViews() {
        view.backgroundColor = .white
        
        viewA.backgroundColor = .lightGray
        viewB.backgroundColor = .red
        viewC.backgroundColor = .blue
        viewD.backgroundColor = .yellow
        viewE.backgroundColor = .green
        labelOne.backgroundColor = .orange
    }
    
    func addLabels() {
        addLabel(to: viewA, text: "A")
        addLabel(to: viewB, text: "B")
        addLabel(to: viewC, text: "C")
        addLabel(to: viewD, text: "D")
        addLabel(to: viewE, text: "E")
    }
    func setupLabel() {
        labelOne.text = "Здесь будет название выбранной View"
        labelOne.font = UIFont.systemFont(ofSize: 15)
        labelOne.textColor = .blue
        labelOne.textAlignment = .center
    }
    
}

// MARK: -> Private Methods
private extension ViewController {
    func addLabel(
        to view: UIView,
        text: String
    ) {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 5)
            ,
            label.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 5
            )
        ])
    }
    
}

private extension ViewController {
    func setupLayout() {
        [viewA, viewB, viewC, viewD, viewE, labelOne].forEach { array in
            array.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            
            viewA.topAnchor.constraint(
                equalTo: self.view.safeAreaLayoutGuide.topAnchor,
                constant: 20
            ),
            viewA.leadingAnchor.constraint(
                equalTo: self.view.leadingAnchor,
                constant: 20
            ),
            viewA.trailingAnchor.constraint(
                equalTo: self.view.trailingAnchor,
                constant: -20
            ),
            viewA.heightAnchor.constraint(
                equalToConstant: 300
            ),
            
            viewB.topAnchor.constraint(
                equalTo: viewA.topAnchor,
                constant: 20
            ),
            viewB.leadingAnchor.constraint(
                equalTo: viewA.leadingAnchor,
                constant: 20
            ),
            viewB.widthAnchor.constraint(
                equalToConstant: 150
            ),
            viewB.heightAnchor.constraint(
                equalToConstant: 150
            ),
            
            viewC.topAnchor.constraint(
                equalTo: viewA.topAnchor,
                constant: 20
            ),
            viewC.trailingAnchor.constraint(
                equalTo: viewA.trailingAnchor,
                constant: -20
            ),
            viewC.widthAnchor.constraint(
                equalToConstant: 150
            ),
            viewC.heightAnchor.constraint(
                equalToConstant: 150
            ),
            
            viewD.bottomAnchor.constraint(
                equalTo: viewB.bottomAnchor,
                constant: -20
            ),
            viewD.leadingAnchor.constraint(
                equalTo: viewB.leadingAnchor,
                constant: 20
            ),
            viewD.widthAnchor.constraint(
                equalToConstant: 100
            ),
            viewD.heightAnchor.constraint(
                equalToConstant: 50
            ),
            
            viewE.topAnchor.constraint(
                equalTo: viewC.topAnchor,
                constant: 60
            ),
            viewE.centerXAnchor.constraint(
                equalTo: viewC.centerXAnchor
            ),
            viewE.widthAnchor.constraint(
                equalToConstant: 80
            ),
            viewE.heightAnchor.constraint(
                equalToConstant: 120
            ),
            
            labelOne.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: -50
            ),
            labelOne.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            labelOne.heightAnchor.constraint(
                equalTo: view.heightAnchor,
                multiplier: 0.1
            ),
            labelOne.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 0.7
            )
        ])
    }
}

//MARK: - Protocol CustomView
extension ViewController: ICustomViewDelegate {
    func pressedViewDelegate(_ nameView: String) {
        labelOne.text = nameView
    }
}


//
//  ViewController.swift
//  SketchWall
//
//  Created by Aiden on 19/11/2021.
//

import UIKit

class ViewController: UIViewController {

    let wall = WallView()
    let colorButtonFactory = ColorButtonFactory()
    let colors: [UIColor] = [.blue, .yellow, .red, .black]
    
    let undoButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(undoDrawing), for: .touchUpInside)
        return button
    }()
    
    let clearButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(clearDrawing), for: .touchUpInside)
        return button
    }()

    @objc fileprivate func colorButtonClicked(sender: UIButton) {
        wall.changeLineColor(to: sender.backgroundColor ?? .black)
    }
    
    @objc fileprivate func undoDrawing() {
        wall.undoDrawing()
    }
    
    @objc fileprivate func clearDrawing() {
        wall.clearDrawing()
    }
    
    
    fileprivate func setupLayout() {
        wall.backgroundColor = .white
        wall.frame = view.frame
        
        var colorButtons = [UIButton]()
        for color in colors {
            let button = colorButtonFactory.createColorButton(bgColor: color, text: nil, borderColor: .black, width: 1, forTarget: self, forAction: #selector(colorButtonClicked(sender:)), forEvent: .touchUpInside)
            colorButtons.append(button)
        }
        let colorStack = UIStackView(arrangedSubviews: colorButtons)
        colorStack.distribution = .fillEqually
        
        
        let stackView = UIStackView(arrangedSubviews: [undoButton, clearButton, colorStack])
        stackView.distribution = .fillEqually
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    override func loadView() {
        self.view = wall
    }

}


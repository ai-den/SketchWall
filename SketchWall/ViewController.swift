//
//  ViewController.swift
//  SketchWall
//
//  Created by Aiden on 19/11/2021.
//

import UIKit

class ViewController: UIViewController {

    let wall = WallView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(wall)
        wall.backgroundColor = .white
        wall.frame = view.frame
    }


}


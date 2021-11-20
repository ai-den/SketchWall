//
//  ViewController.swift
//  SketchWall
//
//  Created by Aiden on 19/11/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wall: WallView!
    @IBOutlet weak var undo: UIButton!
    @IBOutlet weak var clear: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(wall)
        wall.backgroundColor = .white
        wall.frame = view.frame
        
    }

    @IBAction func undoClicked(_ sender: Any) {
        wall.undoDrawing()
    }
    
    @IBAction func clearClickd(_ sender: Any) {
        wall.clearDrawing()
    }
    
}


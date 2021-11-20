//
//  WallView.swift
//  SketchWall
//
//  Created by Aiden on 19/11/2021.
//

import UIKit

struct Line {
    var point: CGPoint = .zero
    var color: UIColor = .blue
}

class WallView: UIView {
    
    fileprivate var manyLines = [[Line]]()
    fileprivate var lineColor: UIColor = UIColor.black

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setLineWidth(10)
        context.setLineCap(.round)
        
        for lines in manyLines {
            for (index, line) in lines.enumerated() {
                if index == 0 {
                    context.setStrokeColor(line.color.cgColor)
                    context.move(to: line.point)
                } else {
                    context.setStrokeColor(line.color.cgColor)
                    context.addLine(to: line.point)
                }
            }
            context.strokePath()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        manyLines.append([Line]())
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        
        guard let point = touches.first?.location(in: nil) else { return }
        guard var lastLines = manyLines.popLast() else { return }
        lastLines.append(Line(point: point, color: lineColor))
        manyLines.append(lastLines)
        setNeedsDisplay()
    }
    
    func undoDrawing() {
        if !manyLines.isEmpty {
            manyLines.removeLast()
            setNeedsDisplay()
        }
    }
    
    func clearDrawing() {
        if !manyLines.isEmpty {
            manyLines.removeAll()
            setNeedsDisplay()
        }
    }
    
    func changeLineColor(to color: UIColor) {
        lineColor = color
    }
}

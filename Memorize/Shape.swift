//
//  Shape.swift
//  Memorize
//
//  Created by Furqan on 05/07/2022.
//

import Foundation
import SwiftUI

struct Pie:Shape
{
    var startAngle:Angle
    var endAngle:Angle
    
    func path(in rect: CGRect) -> Path
    {
        let center=CGPoint(x: rect.midX, y: rect.midY)
        let radius=min(rect.width,rect.height)/2
        let start=CGPoint(
            x: center.x+CGFloat(radius*cos(startAngle.radians)),
            y: center.y+CGFloat(radius*sin(startAngle.radians))
            )
        var p=Path()
        p.move(to:center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise:true
        )
        p.addLine(to: center)
        return p
    }
    
   
}

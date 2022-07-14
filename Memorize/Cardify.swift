//
//  Cardify.swift
//  Memorize
//
//  Created by Furqan on 14/07/2022.
//

import SwiftUI
struct Cardify: ViewModifier
{
    var isFaceUp:Bool
    func body(content: Content) -> some View
    {
            ZStack
            {
                let shape=RoundedRectangle(cornerRadius: 10)
                if isFaceUp
                {
                    shape.foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 5.0)
                   
                }
                else{
                    shape.fill()
                    
                }
                content.opacity(isFaceUp ? 1 : 0)
    }
    
    
}
}
extension View
{
    func cardify(isFaceup:Bool)->some View
    {
        return self.modifier(Cardify(isFaceUp: isFaceup))
        
    }
    
}

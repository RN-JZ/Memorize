//
//  Theme.swift
//  Memorize
//
//  Created by Furqan on 23/06/2022.
//

import Foundation
struct Theme
{
    var name:String
    var emojis:Array<String>
    var numberOfPairOfCard:Int
    var color:String
    init(name:String,emojis:Array<String>,numberOfPairOfCard:Int,color:String)
    {
        self.name=name
        self.emojis=emojis
        self.numberOfPairOfCard = numberOfPairOfCard > emojis.count ? emojis.count:numberOfPairOfCard
         self.color=color
    }
}

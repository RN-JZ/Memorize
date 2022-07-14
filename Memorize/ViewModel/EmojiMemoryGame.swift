//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Furqan on 21/06/2022.
//

import SwiftUI

class EmojiMemoryGame:ObservableObject
{
    init()
    {
        theme=EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model=EmojiMemoryGame.Memory(theme:theme)
    }
    private var theme:Theme
    static var themes:Array<Theme> = [
        Theme(name:"Car",
              emojis:[ "🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠", "🚟", "🚃", "🚋", "🚞", "🚝", "🚄", "🚅", "🚈", "🚂", "🚆", "🚇", "🚊", "🚉", "🚁", "🛩", "✈️", "🛫", "🛬", "🚀", "🛰", "💺", "🛶", "⛵️", "🛥", "🚤", "🛳", "⛴", "🚢", "⚓️", "🚧", "⛽️", "🚏", "🚦", "🚥"],
              numberOfPairOfCard: 5,
              color: "red"
              
        ),
        Theme(name:"Face",
              emojis:["😀","😃","😄","😁","😆","😅","😂","🤣","☺️","😊","😇","🙂","🙃","😉","😌","😍","😘","😗","😙","😚","😋","😜","😝","😛","🤑","🤗","🤓","😎","🤡","🤠","😏","😒","😞","😔","😟","😕","🙁","☹️","😣","😖","😫","😩","😤","😠","😡","😶","😐","😑","😯","😦","😧","😮","😲","😵","😳","😱","😨","😰","😢","😥","🤤","😭","😓","😪","😴","🙄","🤔","🤥","😬","🤐","🤢","🤧","😷","🤒","🤕","😈","👿","👹","👺","💩","👻","💀","☠️","👽","👾","🤖","🎃","😺","😸","😹","😻","😼","😽","🙀","😿","😾"],
              numberOfPairOfCard: 10,
              color: "Yellow"
              
        ),
        Theme(name:"Heart",
              emojis:["❤️","💛","💚","💙","💜","🖤","💔","❣️","💕","💞","💓","💗","💖","💘","💝"],
              numberOfPairOfCard: 4,
              color: "Pink"
              
        ),
        Theme(name:"Sport",
              emojis:[ "⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸", "🥅", "🏒", "🏑", "🏏", "⛳️", "🏹", "🎣", "🥊"],
              numberOfPairOfCard: 5,
             color: "Green"
                            
        ),
        Theme(
            name:"Fruit's",
            emojis: [ "🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈", "🍒", "🍑", "🍍","🥝","🥑", "🍅"],
            numberOfPairOfCard: 4,
            color:"black"
        )
        
                      
    ]
    var getScore:Int{
        return model.score
    }
    var ThemeName:String
    {
        return theme.name
    }
    var themeColor:Color
    {
        switch theme.color
        {
        case "red":
            return .red
        case "Yellow":
            return .yellow
        case "black":
            return .black
        case "Green":
            return .green
        case "Pink":
            return .pink
        default:
            return .white
        }
      
        
        
    }
    static func Memory(theme:Theme)->MemoryGame<String>
    {
        return MemoryGame(numberOfPairofCard:theme.numberOfPairOfCard){ value in  theme.emojis[value]}
    }
    
    //INITILIZATION OF MODEL
    @Published private var model:MemoryGame<String>
    
    //Provide Number of Card
    var cards:Array<MemoryGame<String>.Card>{
        return model.card
    }
    
    //MARK->INTENT
    func choose(_ card:MemoryGame<String>.Card)
    {
        model.Choose(card)
    }
    func newGame()
    {
        theme=EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model=EmojiMemoryGame.Memory(theme:theme)
        
        
        
        
    }
}

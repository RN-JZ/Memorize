

import Foundation
import SwiftUI
struct MemoryGame<CardContent> where CardContent:Equatable //Generic //or donotKnow
{
    private(set) var card:Array<Card>
    //COMPUTED PROPERTY
    private var FaceUp:Int?
    {
        get
        {
            return card.indices.filter({card[$0].isFaceUp}).oneAndOnly
        }
        set
        {
            card.indices.forEach({card[$0].isFaceUp = ($0 == newValue)})
            
            
            
        }
    }
    var score:Int=0
    //As classes are immutable to chage it we have to use property Mutating
    
    mutating func Choose(_ cardval:Card)
    {
        if let IndexVal=card.firstIndex(where:{$0.id==cardval.id})// get id of click card
            ,!card[IndexVal].isMatch// check this card is not in match
            ,!card[IndexVal].isFaceUp //Check Array for index //check forFaceup
        {
            print("Hello1")
            if let local=FaceUp
            {
                print("Hello2")
                if card[IndexVal].content == card[local].content //if card value meet with
              {
                card[IndexVal].isMatch=true
                card[local].isMatch=true
                score=score+1
               }
                else
                {
                    score=score-1
                }
                card[IndexVal].isFaceUp=true
                print(card)
            }
            else{
                   
                    FaceUp=IndexVal
                }
            
          
           
            
        }
        
        
        
        
    }
    init(numberOfPairofCard:Int , createCardContent:(Int)->CardContent)
    {
        card=Array<Card>()
        for itr in 0..<numberOfPairofCard
        {
            let context=createCardContent(itr)
            card.append(Card(content:context,id: itr*2))
            card.append(Card(content:context,id:itr*2+1))
        }
        card.shuffle()
        
    }
}
extension MemoryGame
{
    struct Card:Identifiable
    {
        
        var isFaceUp:Bool=false
        var isMatch:Bool=false
        var content:CardContent
        var id:Int
    }
}
extension Array
{
    var oneAndOnly:Element?
    {
        if count == 1
        {
            return first
        }
        else
        {
             return nil
        }
        
    }
}

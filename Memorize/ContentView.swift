//
//  ContentView.swift
//  Memorize
//
//  Created by Furqan on 21/06/2022.
//

import SwiftUI

struct ContentView: View
{
    @ObservedObject var viewModel:EmojiMemoryGame
    var body: some View
    {
        VStack
        {
            HStack
            {
                Text(viewModel.ThemeName)
                    .font(.largeTitle)
                Spacer()
                Text("Score:\(viewModel.getScore)")
                    .font(.largeTitle)
            }
            
            AspectRatio(items:viewModel.cards,aspectRatio:2/3,content:
            {
                card in
                CardView(card:card)
                    .padding(4)
                .onTapGesture
                {viewModel.choose(card)}
                
            })

           
//            Button(action:{
//                viewModel.newGame()
//
//            }, label:{
//                Text("New Game")
//                    .font(.largeTitle)
//            })
//       }.padding(.horizontal)
       
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel:EmojiMemoryGame())
    }
}


struct CardView:View{
    var card:MemoryGame<String>.Card
    
    var body:some View
    {
        
        GeometryReader(content:{
            geometry in
            ZStack
            {
               
                    Pie(startAngle: Angle(degrees:(0-90)), endAngle:Angle(degrees:110-90))
                        .opacity(0.5)
                        .padding(1)
                        .foregroundColor(.pink)
                    Text(card.content)
                        .rotationEffect(Angle.degrees(card.isMatch ? 360 : 0))
                        .animation(Animation.easeOut(duration:2).repeatForever(autoreverses: false))
                        .font(Font.system(size:25))
                        .scaleEffect(min(geometry.size.width,geometry.size.height)/(32/0.7))

                        
                
            }.cardify(isFaceup: card.isFaceUp)
        })
    }

}
}

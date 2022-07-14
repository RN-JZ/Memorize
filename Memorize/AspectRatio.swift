//
//  AspectRatio.swift
//  Memorize
//
//  Created by Furqan on 29/06/2022.
//

import SwiftUI

struct AspectRatio<item,itemView>: View where itemView:View,item:Identifiable
{
    var items:[item]//DATA CAN BE OF ANY TYPE SO MAKE IT GENERIC
    var aspectRatio:CGFloat
    var content:(item)->itemView // input can be generic and return can be generic
    var body: some View
    {
        GeometryReader{
            geometry in
            let width:CGFloat=widththatFits(itemCount: items.count, in: geometry.size, itemAspectRatio: aspectRatio)
        
        LazyVGrid(columns: [adaptGridView(width:width)],spacing: 0)
        {
            ForEach(items)
            {
                item in
                content(item).aspectRatio(aspectRatio ,contentMode: .fit)
                
            }
        }
    }
    }
}
private func adaptGridView(width:CGFloat)->GridItem
{
   var grid = GridItem(.adaptive(minimum:width))
    grid.spacing=0
    return grid
    
}
private func widththatFits(itemCount:Int,in size:CGSize,itemAspectRatio:CGFloat)->CGFloat //UNDESRTAND THIS LOGIC
{
    var coloumCount=1
    var rowCount=itemCount
    repeat{
        let itemWidth=size.width/CGFloat(coloumCount)
        let itemHeight=itemWidth/itemAspectRatio
        if CGFloat(rowCount)*itemHeight<size.height
        {
            break
        }
        coloumCount+=1
        rowCount=(itemCount+(coloumCount-1))/coloumCount //ambigious
    }while coloumCount<itemCount
    if coloumCount>itemCount
    {
        coloumCount=itemCount
    }
    return floor(size.width/CGFloat(coloumCount))
}


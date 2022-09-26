//
//  Item.swift
//  e-ticaret
//
//  Created by utku enes alagöz on 26.09.2022.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID().uuidString
    var title:String
    var subTitle:String
    var price: String
    var rating:String
    var image:String
}
var items = [
    
    Item(title: "Vincent Chase", subTitle: "Red Full Rim", price: "$36", rating: "3.8", image: "p1"),
    Item(title: "John Jacobs", subTitle: "Brown Tortoise", price: "$45", rating: "4.9", image: "p2"),
    Item(title: "Wood Black", subTitle: "Office Glass", price: "$84", rating: "4.2", image: "p3"),
    Item(title: "Vu Abstract", subTitle: "Fashion U", price: "$65", rating: "3.5", image: "p4")
]

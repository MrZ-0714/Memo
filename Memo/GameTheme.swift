//
//  GameTheme.swift
//  Memo
//
//  Created by Zimo Zhao on 5/5/21.
//

//MARK: - Assignment Requirement
/***
 3.
 Architect the concept of a βthemeβ into your game.
 A theme consists of
    a name for the theme,
    a set of emoji to use,
    a number of cards to show (which, for at least one, but not all themes, should be random),
    and an appropriate color to use to draw (e.g. orange would be appropriate for a Halloween theme).
 
 4. Support at least 6 different themes in your game.
 ***/
import SwiftUI

//MARK: - GameTheme struct
struct GameTheme {
    let name: String
    let emojis: [String]
    let numberOfCardsToShowMinusOne: Int?
    let color: SwiftUI.Color
    
    static let animal = GameTheme(name: "Animals", emojis: ["πΆ","π±","π­","πΉ","π°","π¦","π»"], numberOfCardsToShowMinusOne: 5, color: .green)
    static let fruit = GameTheme(name: "Fruits", emojis: ["π","π","π","π","π","π","π"], numberOfCardsToShowMinusOne: 5, color: .orange)
    static let ball = GameTheme(name: "Ball", emojis: ["β½οΈ","π","π","βΎοΈ","π₯","πΎ","π"], numberOfCardsToShowMinusOne: nil, color: .blue)
    static let car = GameTheme(name: "Cars", emojis: ["π","π","π","π","π","π","π"], numberOfCardsToShowMinusOne: 4, color: .yellow)
    static let apple = GameTheme(name: "iProducts", emojis: ["βοΈ","π±","π»","π₯","π±","β¨οΈ","π‘"], numberOfCardsToShowMinusOne: 6, color: .black)
    static let flag = GameTheme(name: "Flags", emojis: ["πΊπ³","π¨π³","π§πͺ","πͺπΊ","πͺπΈ","πΊπΈ","π¬π§"], numberOfCardsToShowMinusOne: nil, color: .gray)
    
    static let themes: [GameTheme] = [animal, fruit, ball, car, apple, flag]
}

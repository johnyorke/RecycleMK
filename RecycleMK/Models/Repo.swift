//
//  RecyclableRepository.swift
//  RecycleMK
//
//  Created by John Yorke on 13/07/2019.
//  Copyright © 2019 John Yorke. All rights reserved.
//

import Foundation

struct Repo {
    
    static let recyclables: [Recyclable] = [
        Recyclable(title: "Newspaper", note: nil, type: .paperAndCardboard),
        Recyclable(title: "Shredded Paper", note: nil, type: .paperAndCardboard),
        Recyclable(title: "Catalogue", note: "Argos, NEXT etc.", type: .paperAndCardboard),
        Recyclable(title: "Directory", note: "Phone books.", type: .paperAndCardboard),
        Recyclable(title: "Paper", note: nil, type: .paperAndCardboard),
        Recyclable(title: "Card", note: nil, type: .paperAndCardboard),
        Recyclable(title: "Cardboard", note: "Break it down so it can fit inside in the sack.", type: .paperAndCardboard),
        Recyclable(title: "Envelope", note: "With or without windows.", type: .paperAndCardboard),
        Recyclable(title: "Drinks Bottle", note: nil, type: .plasticBottles),
        Recyclable(title: "Milk Bottle", note: nil, type: .plasticBottles),
        Recyclable(title: "Detergent/Bleach Bottle", note: nil, type: .plasticBottles),
        Recyclable(title: "Shampoo/Shower Gel Bottle", note: nil, type: .plasticBottles),
        Recyclable(title: "Yoghurt Pot", note: nil, type: .plasticBottles),
        Recyclable(title: "Margarine Tub", note: nil, type: .plasticBottles),
        Recyclable(title: "Fruit Punnet", note: nil, type: .plasticBottles),
        Recyclable(title: "Ready Meal Container", note: nil, type: .plasticBottles),
        Recyclable(title: "Handwash Bottle", note: "Include trigger/pump.", type: .plasticBottles),
        Recyclable(title: "Disposable Cup", note: nil, type: .plasticBottles),
        Recyclable(title: "Disposable Cutlery", note: nil, type: .plasticBottles),
        Recyclable(title: "Plastic Lid/Bottle Cap", note: nil, type: .plasticBottles),
        Recyclable(title: "Food Tin", note: "Baked beans, soup, etc.", type: .cansAndTins),
        Recyclable(title: "Drinks Can", note: nil, type: .cansAndTins),
        Recyclable(title: "Pet Food Tins", note: nil, type: .cansAndTins),
        Recyclable(title: "Sweet/Biscuit Tin", note: nil, type: .cansAndTins),
        Recyclable(title: "Metal Lid", note: "From bottle or jars.", type: .cansAndTins),
        Recyclable(title: "Aluminium Foil", note: nil, type: .cansAndTins),
        Recyclable(title: "Aluminium Food Tray", note: nil, type: .cansAndTins),
        Recyclable(title: "Fruit Juice Carton", note: nil, type: .foodAndDrinkCartons),
        Recyclable(title: "Soup Carton", note: nil, type: .foodAndDrinkCartons),
        Recyclable(title: "Milk Carton", note: nil, type: .foodAndDrinkCartons)
    ]
    
    
    static func recyclables(for type: RecyclableType) -> [Recyclable] {
        return recyclables.filter { $0.type == type }
    }
}



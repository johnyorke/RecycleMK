//
//  IsItRecyclableIntentHandler.swift
//  Intent
//
//  Created by John Yorke on 24/10/2019.
//  Copyright © 2019 John Yorke. All rights reserved.
//

import Foundation
import Intents

class IsItRecyclableIntentHandler: NSObject, IsItRecyclableIntentHandling {
    func resolveItem(for intent: IsItRecyclableIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        completion(.success(with: intent.item ?? ""))
    }


    func handle(intent: IsItRecyclableIntent, completion: @escaping (IsItRecyclableIntentResponse) -> Void) {
        let oracle = RecyclableOracle()
        if
            let searchString = intent.item,
            let recyclable = oracle.isItemRecyclable(searchString)
            {
                completion(.success(isRecyclable: 1, tip: recyclable.type.note ?? ""))
        } else {
            completion(.success(isRecyclable: 0, tip: ""))
        }
    }

}

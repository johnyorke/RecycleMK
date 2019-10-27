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
        guard let item = intent.item else {
            completion(.success(with: intent.item ?? ""))
            return
        }
        let items = RecyclableOracle.isItemRecyclable(item)
        switch items.count {
        case 0:
            completion(.confirmationRequired(with: item))
        case 1:
            completion(.success(with: item))
        default:
            completion(.disambiguation(with: items.compactMap { $0.title } ))
        }
    }

    func handle(intent: IsItRecyclableIntent, completion: @escaping (IsItRecyclableIntentResponse) -> Void) {
        if
            let searchString = intent.item,
            let item = RecyclableOracle.isItemRecyclable(searchString).first
            {
                let string = RecyclableOracleResponseBuilder.string(from: item)
                let response = RecyclableOracleResponse(identifier: UUID().uuidString, display: string)
                completion(.isRecyclable(response: response))
        } else {
            let string = RecyclableOracleResponseBuilder.nonRecyclableString()
            let response = RecyclableOracleResponse(identifier: UUID().uuidString, display: string)
            completion(.isNotRecyclable(response: response))
        }
    }
}

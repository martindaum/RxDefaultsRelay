//
//  ObservableType+DefaultsRelay.swift
//  Pods-RxDefaultsRelay_Example
//
//  Created by Martin Daum on 16.11.18.
//

import Foundation
import RxSwift
import RxRelay

extension ObservableType where Element: Codable {
    public func bind(to relay: DefaultsRelay<Element>) -> Disposable {
        return subscribe { e in
            switch e {
            case .next(let element):
                relay.accept(element)
            case .error:
                fatalError("error in binding")
            case .completed:
                break
            }
        }
    }
    
    public func bind(to relay: DefaultsRelay<Element?>) -> Disposable {
        return self.map { $0 as Element? }.bind(to: relay)
    }
}

//
//  DIContainer.swift
//  SImpleDI
//
//  Created by Labib Muhajir on 11/03/21.
//

import Foundation

final class DIContainer {
    static let shared = DIContainer()

    private var factories: [FactoryKey: Any] = [:]

    static func register<T: Any>(name: String? = nil, resolver: T) {
        let key = FactoryKey(type: T.Type.self, name: name)
        shared.factories[key] = resolver
    }

    static func resolve<T: Any>(name: String? = nil) -> T {
        let key = FactoryKey(type: T.Type.self, name: name)
        guard let result = shared.factories[key] as? T else {
          fatalError("no dependency found")
        }

        return result
    }

    static func clear() {
        shared.factories.removeAll()
    }
}

class FactoryKey: Hashable, Equatable {
    private let type: Any.Type
    private let name: String?

    init(type: Any.Type, name: String? = nil) {
        self.type = type
        self.name = name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(type))
        hasher.combine(name)
    }

    static func == (lhs: FactoryKey, rhs: FactoryKey) -> Bool {
        return lhs.type == rhs.type && lhs.name == rhs.name
    }
}

@propertyWrapper
struct Inject<T>{
    private var component: T
    
    init(factoryName name: String? = nil){
        self.component = DIContainer.resolve(name: name)
    }
    
    public var wrappedValue: T {
        get { return component}
        mutating set { component = newValue }
    }
}

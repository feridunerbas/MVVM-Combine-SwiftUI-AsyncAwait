//
//  CitiesTree.swift
//  City Search
//
//  Created by Feridun Erbas on 29.03.2022.
//

import Foundation

class CitiesTree {
    
    // MARK: - Properties
    private(set) var cities: [CityDataModel] = []
    private(set) var root = CityNode()
    
}

// MARK: - CitiesTreeProtocol
extension CitiesTree: CitiesTreeProtocol {
    
    /// Constructs the cities tree with given values
    ///
    /// - parameter cities: Initial cities array of the tree
    /// - complexity: O(n)
    ///
    func insert(cities: [CityDataModel]) async {
        cities.forEach { city in
            let name = city.name?.lowercased() ?? ""
            insert(city: city, name: name, node: root)
        }
        sortKeys(node: root)
    }
    
    /// Constructs the cities tree with given values
    ///
    /// - parameter cities: Initial cities array of the tree
    /// - complexity: O(k+m) where m is the desired max count of the result and k is the character count of prefix string
    ///
    func search(prefix: String, maxCount: Int) async -> [CityDataModel] {
        guard let node = findNode(node: root, prefix: prefix.lowercased()) else { return [] }
        let collected = collect(node: node, maxCount: maxCount)
        let maxCount = min(collected.count, maxCount)
        return Array(collected.prefix(upTo: maxCount))
    }

}

// MARK: - Private Methods
private extension CitiesTree {
    
    /// Inserts single City object to the tree
    ///
    /// - parameter city: City object to be inserted
    /// - parameter name: Remaining character path for CityNode to be inserted
    /// - parameter node: CityNode reference in the current iteration
    /// - complexity: O(k) where k is the length of name
    ///
    func insert(city: CityDataModel, name: String, node: CityNode) {
        var name = name
        if !name.isEmpty {
            let char = name.removeFirst()
            if node.dictionary[char] == nil {
                node.dictionary[char] = CityNode()
            }
            insert(city: city, name: name, node: node.dictionary[char]!)
        } else {
            node.cities.append(city)
        }
    }
    
    /// Inserts single City object to the tree
    ///
    /// - parameter city: City object to be inserted
    /// - parameter name: Remaining character path for CityNode to be inserted
    /// - parameter node: CityNode reference in the current iteration
    /// - complexity: O(k) where k is the length of name
    ///
    func sortKeys(node: CityNode) {
        node.sortedKeys = node.dictionary.keys.sorted { $0 > $1 }
        node.dictionary.forEach { _, child in
            sortKeys(node: child)
        }
    }
    
    /// Search Cities for given prefix
    ///
    /// - parameter node: CityNode reference in the current iteration
    /// - parameter prefix: Remaining character path for destination cities Node
    /// - complexity: O(k) where k is the length of prefix
    ///
    func findNode(node: CityNode, prefix: String) -> CityNode? {
        var prefix = prefix
        if !prefix.isEmpty {
            let char = prefix.removeFirst()
            if let child = node.dictionary[char] {
                return findNode(node: child, prefix: prefix)
            }
            return nil
        }
        return node
    }
    
    /// Search Cities for given prefix
    ///
    /// - parameter node: CityNode reference in the current iteration
    /// - parameter maxCount: Number of search results to be obtained
    /// - complexity: O(k) in worst case where k is maxCount
    ///
    func collect(node: CityNode, maxCount: Int) -> [CityDataModel] {
        var result: [CityDataModel] = []
        result.append(contentsOf: node.cities)
        var keys = node.sortedKeys
        var currentRequiredMaxCount = maxCount - node.cities.count
        while result.count < maxCount, !keys.isEmpty {
            let key = keys.removeLast()
            let newItems = collect(node: node.dictionary[key]!, maxCount: currentRequiredMaxCount)
            currentRequiredMaxCount -= newItems.count
            result.append(contentsOf: newItems)
        }
        return result
    }
    
}

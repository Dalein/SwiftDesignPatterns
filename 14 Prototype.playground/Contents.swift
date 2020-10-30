import UIKit


protocol TableViewCell {
    var identifier: String { get set }
    
    init(identifier: String)
    func clone() -> Self
}


struct ExampleCell: TableViewCell {
    var identifier: String
    
    func clone() -> ExampleCell {
        ExampleCell(identifier: identifier)
    }
    
}


struct TableView {
    var identifierCache = [String: TableViewCell]()
    var cellCache = [String: [TableViewCell]]()
    
    
    mutating func register(_ type: TableViewCell.Type, for identifier: String) {
        identifierCache[identifier] = type.init(identifier: identifier)
    }
    
    mutating func enqueue(_ cell: TableViewCell) {
        print("Enqueing cell with identifier \(cell.identifier)")
        
        // fetch the current cache for this identifier or create it if it doesn’t exist, then append this cell to it.
        cellCache[cell.identifier, default: []].append(cell)
    }
    
    mutating func dequeue(identifier: String) -> TableViewCell {
        // attempt to find a cached cell for this identifier
        guard let cachedCell = cellCache[identifier]?.popLast() else {
            
            // attempt to find the prototype for this identifier
            guard let cellType = identifierCache[identifier] else {
                // no prototype - error!
                fatalError("No worker registered for \(identifier)")}
            print("Creating new cell with identifier \(identifier)")
            return cellType.clone()
        }
        
        print("Dequeuing cell with identifier \(identifier)")
        return cachedCell
    }
    
}

var tableView = TableView()
let cellIdentifier = "Default"

tableView.register(ExampleCell.self, for: cellIdentifier)

let first = tableView.dequeue(identifier: cellIdentifier)
let second = tableView.dequeue(identifier: cellIdentifier)

tableView.enqueue(first)

let third = tableView.dequeue(identifier: cellIdentifier)

tableView.enqueue(second)

let fourth = tableView.dequeue(identifier: cellIdentifier)
let fifth = tableView.dequeue(identifier: "Unknown")

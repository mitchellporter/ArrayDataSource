
//  ArrayDataSource.swift

import Foundation

typealias ConfigureCellClosure = (cell: AnyObject, item: AnyObject) -> Void

class ArrayDataSource: NSObject, UITableViewDataSource {
    
    var items: NSArray?
    var cellIdentifier: String?
    var cellClosure: ConfigureCellClosure?
    
    override init() {
        
        print("basic init called too!")
        
        super.init()
    }
    
     init(items: NSArray, cellIdentifier: String, cellClosure: ConfigureCellClosure) {
        
        self.items = items
        self.cellIdentifier = cellIdentifier
        self.cellClosure = cellClosure
        
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> AnyObject {
        
        return items![indexPath.row]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let items = items else {
            return 0;
        }
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier!, forIndexPath: indexPath)
        let item = self.itemAtIndexPath(indexPath)
        cellClosure!(cell: cell, item: item)
        return cell
    }
}

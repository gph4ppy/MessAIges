//
//  HistoryEntity+CoreDataProperties.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 06/04/2023.
//
//

import Foundation
import CoreData

@objc(HistoryEntity)
public class HistoryEntity: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<HistoryEntity> {
        return NSFetchRequest<HistoryEntity>(entityName: "HistoryEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var date: Date?
    @NSManaged public var messages: NSOrderedSet?
}

// MARK: Generated accessors for messages
extension HistoryEntity {
    @objc(insertObject:inMessagesAtIndex:)
    @NSManaged public func insertIntoMessages(_ value: MessagesEntity, at idx: Int)

    @objc(removeObjectFromMessagesAtIndex:)
    @NSManaged public func removeFromMessages(at idx: Int)

    @objc(insertMessages:atIndexes:)
    @NSManaged public func insertIntoMessages(_ values: [MessagesEntity], at indexes: NSIndexSet)

    @objc(removeMessagesAtIndexes:)
    @NSManaged public func removeFromMessages(at indexes: NSIndexSet)

    @objc(replaceObjectInMessagesAtIndex:withObject:)
    @NSManaged public func replaceMessages(at idx: Int, with value: MessagesEntity)

    @objc(replaceMessagesAtIndexes:withMessages:)
    @NSManaged public func replaceMessages(at indexes: NSIndexSet, with values: [MessagesEntity])

    @objc(addMessagesObject:)
    @NSManaged public func addToMessages(_ value: MessagesEntity)

    @objc(removeMessagesObject:)
    @NSManaged public func removeFromMessages(_ value: MessagesEntity)

    @objc(addMessages:)
    @NSManaged public func addToMessages(_ values: NSOrderedSet)

    @objc(removeMessages:)
    @NSManaged public func removeFromMessages(_ values: NSOrderedSet)
}

extension HistoryEntity: History {
    var historyID: UUID {
        id ?? UUID()
    }

    var historyDate: Date {
        date ?? Date()
    }

    var historyMessages: [Message] {
        messages?.array as? [Message] ?? []
    }
}

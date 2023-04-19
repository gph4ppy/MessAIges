//
//  MessagesEntity+CoreDataProperties.swift
//  MessAIges
//
//  Created by Jakub Dąbrowski on 06/04/2023.
//
//

import Foundation
import CoreData

@objc(MessagesEntity)
public class MessagesEntity: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MessagesEntity> {
        return NSFetchRequest<MessagesEntity>(entityName: "MessagesEntity")
    }

    @NSManaged public var text: String?
    @NSManaged public var date: Date?
    @NSManaged public var author: String?
    @NSManaged public var id: UUID?
    @NSManaged public var history: HistoryEntity?
}

extension MessagesEntity: Message {
    var messageAuthor: Authors {
        Authors(from: author ?? "")
    }

    var messageText: String {
        text ?? ""
    }

    var messageDate: Date {
        date ?? Date()
    }

    var messageID: UUID {
        id ?? UUID()
    }
}

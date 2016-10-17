//
//  Youtuber+CoreDataProperties.swift
//  MyFavoriteYoutubers
//
//  Created by cis290 on 10/17/16.
//  Copyright © 2016 Rock Valley College. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Youtuber {

    @NSManaged var youtuberName: String?
    @NSManaged var gender: String?
    @NSManaged var realName: String?
    @NSManaged var twitter: String?
    @NSManaged var youtubeURL: String?

}

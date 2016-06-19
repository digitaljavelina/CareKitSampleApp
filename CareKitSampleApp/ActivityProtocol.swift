//
//  ActivityList.swift
//  CareKitSampleApp
//
//  Created by Michael Henry on 5/1/16.
//  Copyright © 2016 Digital Javelina, LLC. All rights reserved.
//

import CareKit

// protocol that defines properties and methods for activities
protocol Activity {
    
    var activityType: ActivityType { get }
    
    func carePlanActivity() -> OCKCarePlanActivity
}

// enumeration of strings used as identifiers for the activities used in the app
enum ActivityType: String {
    // activities
    case TakeMedication
    case Exercise
    case BrushTeeth
    // assessments
    case Mood
    case Pain
}

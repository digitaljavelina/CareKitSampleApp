//
//  Exercise.swift
//  CareKitSampleApp
//
//  Created by Michael Henry on 5/1/16.
//  Copyright © 2016 Digital Javelina, LLC. All rights reserved.
//

import CareKit

// struct that conforms to the "Activity" protocol to define an exercise activity

struct Exercise: Activity {
    
    // MARK: Activity
    
    let activityType: ActivityType = .Exercise
    
    func carePlanActivity() -> OCKCarePlanActivity {
        // create a weekly schedule
        let startDate = NSDateComponents(year: 2016, month: 5, day: 1)
        let schedule = OCKCareSchedule.weeklyScheduleWithStartDate(startDate, occurrencesOnEachDay: [1, 1, 1, 1, 1, 1, 1])
        
        // get the localized strings to use for the activity
        let title = NSLocalizedString("Exercise", comment: "")
        let summary = NSLocalizedString("15 minutes", comment: "")
        let instructions = NSLocalizedString("Get some exercise", comment: "")
        
        // create the activity
        let activity = OCKCarePlanActivity.interventionWithIdentifier(
            activityType.rawValue,
            groupIdentifier: nil,
            title: title,
            text: summary,
            tintColor: Colors.Purple.color,
            instructions: instructions,
            imageURL: nil,
            schedule: schedule,
            userInfo: nil)
        
        return activity
    }
}
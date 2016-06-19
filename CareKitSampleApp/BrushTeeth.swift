//
//  BrushTeeth.swift
//  CareKitSampleApp
//
//  Created by Michael Henry on 5/3/16.
//  Copyright © 2016 Digital Javelina, LLC. All rights reserved.
//

import CareKit

// struct that conforms to the "Activity" protocol to define a brush teeth activity

struct BrushTeeth: Activity {
    
    // MARK: Activity
    
    let activityType: ActivityType = .BrushTeeth
    
    func carePlanActivity() -> OCKCarePlanActivity {
        // create a weekly schedule
        let startDate = NSDateComponents(year: 2016, month: 5, day: 1)
        let schedule = OCKCareSchedule.dailyScheduleWithStartDate(startDate, occurrencesPerDay: 2)
        
        // get the localized strings to use for the activity
        let title = NSLocalizedString("Brush Teeth", comment: "")
        let summary = NSLocalizedString("2 minutes", comment: "")
        let instructions = NSLocalizedString("Brush your teeth, 30 seconds in each quadrant of your mouth", comment: "")
        
        // create the activity
        let activity = OCKCarePlanActivity.interventionWithIdentifier(
            activityType.rawValue,
            groupIdentifier: nil,
            title: title,
            text: summary,
            tintColor: Colors.Green.color,
            instructions: instructions,
            imageURL: nil,
            schedule: schedule,
            userInfo: nil)
        
        return activity
    }
}

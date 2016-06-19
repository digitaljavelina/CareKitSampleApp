//
//  TakeMedication.swift
//  CareKitSampleApp
//
//  Created by Michael Henry on 5/1/16.
//  Copyright © 2016 Digital Javelina, LLC. All rights reserved.
//

import CareKit

// struct that conforms to the "Activity" protocol to define an activity to take medication
struct TakeMedication: Activity {
    
  /*  // MARK: Determine if activity is already in the store
    
    store.activityForIdenitifier(TakeMedication) { (success, activityOrNil, errorOrNil) in
    */
    
    // MARK: Activity
    
    let activityType: ActivityType = .TakeMedication
    
    func carePlanActivity() -> OCKCarePlanActivity {
        // create a weekly schedule: take medication once per day stating on May 1, 2016
        let startDate = NSDateComponents(year: 2016, month: 5, day: 1)
        let schedule = OCKCareSchedule.weeklyScheduleWithStartDate(startDate, occurrencesOnEachDay: [1, 1, 1, 1, 1, 1, 1])
        
        // get the localized strings to use for the activity
        let title = NSLocalizedString("6-Mercaptopurine", comment: "")
        let summary = NSLocalizedString("Daily dose per oncology team instructions", comment: "")
        let instructions = NSLocalizedString("Take at bedtime, not within 2 hours of dairy", comment: "")
        
        let activity = OCKCarePlanActivity.interventionWithIdentifier(
            activityType.rawValue,
            groupIdentifier: nil,
            title: title,
            text: summary,
            tintColor: Colors.Red.color,
            instructions: instructions,
            imageURL: nil,
            schedule: schedule,
            userInfo: nil)
        
        return activity
    }
}

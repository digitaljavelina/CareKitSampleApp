//
//  CarePlanStoreManager.swift
//  CareKitSampleApp
//
//  Created by Michael Henry on 5/1/16.
//  Copyright © 2016 Digital Javelina, LLC. All rights reserved.
//

import CareKit

class CarePlanStoreManager: NSObject {
    
    // MARK: Static Properties
    
    static var sharedCarePlanStoreManager = CarePlanStoreManager()
    
    // MARK: Properties
    
    weak var delegate: CarePlanStoreManagerDelegate?
    let store: OCKCarePlanStore
    
    // MARK: Initialization
    
    private override init() {
        // determine the file url for the store
        let searchPaths = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)
        let applicationSupportPath = searchPaths[0]
        let storeURL = URL(fileURLWithPath: applicationSupportPath)
        
        myCarePlanStore = OCKCarePlanStore(persistenceDirectoryURL: myDirectoryURL)
        
    }

}

extension CarePlanStoreManager: OCKCarePlanStoreDelegate {
    
    func carePlanStoreActivityListDidChange(store: OCKCarePlanStore) {
        updateInsights()
    }
    
    func carePlanStore(store: OCKCarePlanStore, didReceiveUpdateOfEvent event: OCKCarePlanEvent) {
        updateInsights()
    }
}

protocol CarePlanStoreManagerDelegate: class {
    
    func carePlanStoreManager(manager: CarePlanStoreManager, didUpdateInsights insights: [OCKInsightItem])
}

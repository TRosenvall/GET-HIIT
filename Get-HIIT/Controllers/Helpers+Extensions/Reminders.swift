//
//  Reminders.swift
//  Get-HIIT
//
//  Created by Leah Cluff on 8/27/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import Foundation
import EventKit


public func reminders() {
    
    let eventStore = EKEventStore()
    
    eventStore.requestAccess(to: EKEntityType.reminder) { (granted, error) in
        if !granted {
        print ("Access to reminders not granted \(granted)")
    }
}
    
    let calendars =  eventStore.calendars(for: EKEntityType.reminder)
    for calendar in calendars as [EKCalendar] {
        print("Calendar = \(calendar.title)")
    }
    
    let reminder = EKReminder(eventStore: eventStore)
    reminder.title = "Does this work?"
    reminder.calendar = eventStore.defaultCalendarForNewReminders()
    do {
        try eventStore.save(reminder, commit: true)
    } catch let error  {
        print("Reminder failed with error \(error.localizedDescription)")
    }
    
}


//
//  CalendarVars.swift
//  PracticeCalendar
//
//  Created by Bailey Carlson on 5/1/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import Foundation

let date = Date()
let calendar = Calendar.current
let day = calendar.component(.day, from: date)
var weekday = calendar.component(.weekday, from: date)
var month = calendar.component(.month, from: date)
var year = calendar.component(.year, from: date)

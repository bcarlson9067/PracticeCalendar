//
//  ViewController.swift
//  PracticeCalendar
//
//  Created by Bailey Carlson on 5/1/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var Calendar: UICollectionView!
    var currentMonth = String()
    var NumberOfEmptyBox = Int()
    var nextNumberOfEmptyBox = Int()
    var previousNumberOfEmptyBox = 0
    var direction = 0
    
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    let daysOfMonth = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    let daysInMonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    override func viewDidLoad() {
        Calendar.delegate = self
        Calendar.dataSource = self
        super.viewDidLoad()
        currentMonth = months[month - 1]
        monthLabel.text = "\(currentMonth) \(year)"
        getStartDayPosition()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        switch currentMonth {
        case "January":
            month = 11
            year -= 1
            direction = -1
            currentMonth = months[month - 1]
            getStartDayPosition()
            monthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
            
        default:
            month -= 1
            direction = -1
            currentMonth = months[month - 1]
            getStartDayPosition()
            monthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        switch currentMonth {
        case "December":
            month = 0
            year += 1
            direction = 1
            currentMonth = months[month - 1]
            getStartDayPosition()
            monthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
            
        default:
            direction = 1
            month += 1
            currentMonth = months[month - 1]
            getStartDayPosition()
            monthLabel.text = "\(currentMonth) \(year)"
            print("numberofempty: \(NumberOfEmptyBox)")
            Calendar.reloadData()
        }
    }
    
    func getStartDayPosition() {
//        switch direction{
//        case 0:
//
//        case 1...:
//
//        case -1:
//
//        default:
//            fatalError()
//        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch direction {
        case 0:
            return daysInMonths[month - 1] + NumberOfEmptyBox - 1
        case 1...:
            return daysInMonths[month - 1] + nextNumberOfEmptyBox - 1
        case -1:
            return daysInMonths[month - 1] + previousNumberOfEmptyBox - 1
        default:
            fatalError()
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
        cell.backgroundColor = .clear
        
        if cell.isHidden {
            cell.isHidden = false
        }
        switch direction {
        case 0:
            cell.dateLabel.text = "\(indexPath.row + 2 - NumberOfEmptyBox)"
        case 1:
            cell.dateLabel.text = "\(indexPath.row + 2 - nextNumberOfEmptyBox)"
        case -1:
            cell.dateLabel.text = "\(indexPath.row + 2 - previousNumberOfEmptyBox)"
        default:
            fatalError()
        }
        if Int(cell.dateLabel.text!)! < 1 {
            cell.isHidden = true
        }
        return cell
    }
}


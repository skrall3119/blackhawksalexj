//
//  main.swift
//  BlackHawks
//
//  Created by Alex Janci on 3/1/20.
//  Copyright © 2020 Alex Janci. All rights reserved.
//

import Foundation

var players:[Int: String] = [91: "Drake Caggiula", 22: "Ryan Carpenter", 77: "Kirby Dach", 12: "Alex DeBrincat", 36:"Matthew Highmore", 64:"David Kampf", 88:"Patrick Kane", 8:"Dominik Kubalik", 92: "Alex Nylander", 20:"Brandon Saad", 65: "Andrew Shaw", 15: "Zack Smith", 17:"Dylan Strome", 19: "Jonathan Toews", 27: "Adam Boqvist", 46: "Lucas Carlsson", 44: "Calvin de Haan", 2: "Duncan Keith", 68: "Slater Koekkoek", 6:"Oli Maatta", 5:"Connor Murphy", 7:"Brent Seabrook", 55:"Nick Seeler", 50:"Corey Crawford", 30:"Malcom subban"]

var births: [Int: String] = [91: "Jun 20, 1994", 22: "Jan 18, 1991", 77: "Jan 21, 2001", 12: "Dec 18, 1997", 36: "Feb 27, 1996", 64: "Jan 12, 1995", 88: "Nov 19, 1988", 8: "Aug 21, 1995", 92: "Mar 2, 1998", 20: "Oct 27, 1992", 65: "Jul 20, 1991", 15: "Apr 5, 1988", 17: "Mar 7, 1997", 19: "Apr 29, 1988", 27: "Aug 15, 2000", 46: "Jul 5, 1997",  44: "May 9, 1991", 2: "Jul 16, 1983", 68: "Feb 18, 1994", 6: "Aug 22, 1994", 5: "Mar 26, 1993", 7: "Apr 20, 1985", 55: "Jun 3, 1993", 50: "Dec 31, 1984", 30: "Dec 21, 1993"]

var countries: [String] = ["Canada", "USA", "Canada", "USA", "Canada", "Czechnia", "USA", "Czechnia", "Canada", "USA", "Canada", "Canada", "Canada","Canada", "Sweeden", "Sweeden", "Canada", "Canada", "Canada", "Finland", "USA", "Canada", "USA"]

var heights: [Double] = [177.8, 182.88, 193.04, 170.18, 180.34, 187.96, 177.8, 187.96, 184.42, 184.42, 180.34, 187.96, 190.5, 187.96, 180.34, 182.88, 185.42, 185.42, 187.96, 187.96, 193.04, 190.5, 187.96, 187.96, 187.96]

var currentDate = Date()

func convertToDate(births: [Int: String]) -> [Date]{
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM d, yyyy"
    var dates: [Date] = []
    for (_,date) in births {
        let newDate = formatter.date(from: date)
        dates.append(newDate!)
    }
    
    return dates
}

func calculateAge() -> [Double]{
    var ages: [Double] = []
    let current = Date()
    let dates = convertToDate(births: births)
    for day in dates{
        let components = Calendar.current.dateComponents([.year], from: day, to: current)
        ages.append(Double(components.year ?? 0))
    }
    return ages
}

func findAverage(arr: [Double]) -> Double{
    var total: Double = 0
    for item in arr{
        total += item
    }
    let average = total / Double(arr.count)
    return Double(average)
}

print(players)

let ages = calculateAge()
print(ages.sorted())
print("Average age is: ", findAverage(arr: ages))

print(countries.sorted())

print("Average height is (in cm): ",findAverage(arr: heights))

var counts = [String:Int]()

for (_, date) in births{
    let fixedDate = date.prefix(3)
    counts[String(fixedDate)] = (counts[String(fixedDate)] ?? 0) + 1
}

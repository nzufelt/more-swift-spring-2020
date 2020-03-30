/*
 SortWithClosures
 Some Starter Code to understand closures by sorting
 Author: Nicholas Zufelt
 Date: 2020-03-30
 */
 
var names: [String] = ["Smith", "Johnson", "Williams", "Jones", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor", "Anderson", "Thomas"]

let sorter: (String, String) -> Bool = {
    first, second in
    return first < second
}

names.sort(by: sorter)
print(names)

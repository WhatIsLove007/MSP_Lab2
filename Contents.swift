
import Foundation

// Given string with format "Student1 - Group1; Student2 - Group2; ..."

let studentsStr = "Бортнік Василь - ІВ-72; Чередніченко Владислав - ІВ-73; Гуменюк Олександр - ІВ-71; Корнійчук Ольга - ІВ-71; Киба Олег - ІВ-72; Капінус Артем - ІВ-73; Овчарова Юстіна - ІВ-72; Науменко Павло - ІВ-73; Трудов Антон - ІВ-71; Музика Олександр - ІВ-71; Давиденко Костянтин - ІВ-73; Андрющенко Данило - ІВ-71; Тимко Андрій - ІВ-72; Феофанов Іван - ІВ-71; Гончар Юрій - ІВ-73"

// Task 1
// Create dictionary:
// - key is a group name
// - value is sorted array with students

var studentsGroups: [String: [String]] = [:]

// Add your code here
for i in studentsStr.components(separatedBy: "; "){
	struct nameGroup {
		let name: String
		let group: String

		init(_ pairOfStrings: [String]) {
			name = pairOfStrings[0]
			group = pairOfStrings[1]
		}
	}
	let  getPair = nameGroup(i.components(separatedBy: " - "))
	if studentsGroups[getPair.group] == nil {
		studentsGroups[getPair.group] = [getPair.name]
		} else {
		studentsGroups[getPair.group]?.append(getPair.name)
		}
	}

for group in studentsGroups.keys {
		studentsGroups[group]?.sort()
	}


print(studentsGroups)
print()

// Given array with expected max points

let points: [Int] = [5, 8, 15, 15, 13, 10, 10, 10, 15]

// Task 2
// Create dictionary:
// - key is a group name
// - value is dictionary:
//   - key is student
//   - value is array with points (fill it with random values, use function `randomValue(maxValue: Int) -> Int` )

func randomValue(maxValue: Int) -> Int {
    switch(arc4random_uniform(6)) {
    case 1:
        return Int(ceil(Float(maxValue) * 0.7))
    case 2:
        return Int(ceil(Float(maxValue) * 0.9))
    case 3, 4, 5:
        return maxValue
    default:
        return 0
    }
}

var studentPoints: [String: [String: [Int]]] = [:]

// Add your code here
for group in studentsGroups.keys {
	studentPoints[group] = [:]

	for name in studentsGroups[group]! {
		studentPoints[group]?[name] = []

		for point in points {
			studentPoints[group]?[name]?.append(randomValue(maxValue: point))
		}
	}
}

print(studentPoints)
print()

// Task 3
// Create dictionary:
// - key is a group name
// - value is dictionary:
//   - key is student
//   - value is sum of student's points

var sumPoints: [String: [String: Int]] = [:]

// Add your code here
for group in studentPoints.keys {
	sumPoints[group] = [:]

	for name in studentPoints[group]!.keys {
		var sumPoint = 0

		for i in studentPoints[group]![name]! {
			sumPoint += i
		}
		sumPoints[group]![name] = sumPoint
	}
}


print(sumPoints)
print()

// Task 4
// Create dictionary:
// - key is group name
// - value is average of all students points

var groupAvg: [String: Float] = [:]

// Add your code here
for group in sumPoints.keys {
	var sumGroup = 0
	for i in sumPoints[group]!.values {
		sumGroup += i
	}
	groupAvg[group] = Float(sumGroup)/Float(sumPoints[group]!.values.count)
}

print(groupAvg)
print()

// Task 5
// Create dictionary:
// - key is group name
// - value is array of students that have >= 60 points

var passedPerGroup: [String: [String]] = [:]

// Add your code here
for group in sumPoints.keys {
	passedPerGroup[group] = []

	for name in sumPoints[group]!.keys {
		if sumPoints[group]![name]! >= 60 {
			passedPerGroup[group]!.append(name)
		}
	}
}



print(passedPerGroup)

// Example of output. Your results will differ because random is used to fill points.
//
//["ІВ-72": ["Бортнік Василь", "Киба Олег", "Овчарова Юстіна", "Тимко Андрій"], "ІВ-73": ["Гончар Юрій", "Давиденко Костянтин", "Капінус Артем", "Науменко Павло", "Чередніченко Владислав"], "ІВ-71": ["Андрющенко Данило", "Гуменюк Олександр", "Корнійчук Ольга", "Музика Олександр", "Трудов Антон", "Феофанов Іван"]]
//
//["ІВ-73": ["Капінус Артем": [5, 8, 15, 14, 10, 9, 7, 10, 11], "Чередніченко Владислав": [5, 6, 15, 11, 13, 9, 0, 7, 15], "Давиденко Костянтин": [5, 8, 15, 0, 10, 0, 7, 0, 0], "Науменко Павло": [0, 8, 0, 15, 13, 10, 0, 0, 0], "Гончар Юрій": [5, 0, 11, 15, 10, 10, 10, 9, 15]], "ІВ-72": ["Киба Олег": [0, 8, 15, 11, 13, 10, 10, 9, 0], "Овчарова Юстіна": [4, 8, 15, 15, 13, 10, 7, 10, 15], "Тимко Андрій": [5, 6, 14, 15, 13, 10, 10, 10, 0], "Бортнік Василь": [5, 8, 0, 15, 13, 10, 10, 10, 0]], "ІВ-71": ["Музика Олександр": [4, 8, 15, 0, 12, 10, 10, 10, 15], "Трудов Антон": [5, 0, 0, 14, 12, 10, 0, 9, 0], "Феофанов Іван": [5, 8, 14, 11, 12, 0, 10, 10, 15], "Корнійчук Ольга": [0, 8, 11, 14, 12, 7, 7, 10, 14], "Гуменюк Олександр": [5, 8, 14, 15, 10, 0, 7, 10, 15], "Андрющенко Данило": [4, 8, 15, 15, 13, 0, 10, 7, 0]]]
//
//["ІВ-73": ["Чередніченко Владислав": 81, "Гончар Юрій": 85, "Давиденко Костянтин": 45, "Капінус Артем": 89, "Науменко Павло": 46], "ІВ-72": ["Овчарова Юстіна": 97, "Тимко Андрій": 83, "Бортнік Василь": 71, "Киба Олег": 76], "ІВ-71": ["Музика Олександр": 84, "Корнійчук Ольга": 83, "Феофанов Іван": 85, "Гуменюк Олександр": 84, "Андрющенко Данило": 72, "Трудов Антон": 50]]
//
//["ІВ-72": 81.75, "ІВ-73": 69.2, "ІВ-71": 76.333336]
//
//["ІВ-73": ["Чередніченко Владислав", "Гончар Юрій", "Капінус Артем"], "ІВ-71": ["Гуменюк Олександр", "Корнійчук Ольга", "Андрющенко Данило", "Феофанов Іван", "Музика Олександр"], "ІВ-72": ["Бортнік Василь", "Тимко Андрій", "Овчарова Юстіна", "Киба Олег"]]

// PART TWO

enum Direction {
	case N
	case S
	case W
	case E
}

enum MyExceptions: Error {
	case wrongDeg
	case wrongSec
	case wrongMin
}

class CoordinateVN {
	var lat_direction, lon_direction: Direction
	var lon_minutes, lat_minutes, lon_seconds, lat_seconds: Int
	var lat_deg, lon_deg: Int

	init() {
		lat_direction = .S
		lon_direction = .W
		lat_deg = 0
		lon_deg = 0
		lon_minutes = 0
		lon_seconds = 0
		lat_minutes = 0
		lat_seconds = 0

	}

	init(_ lat_d: Int, _ lon_d: Int, _ lat_m: Int, _ lon_m: Int, _ lat_s: Int, _ lon_s: Int) throws {
		lat_deg = lat_d
		lon_deg = lon_d
		lat_seconds = lat_s
		lon_seconds = lon_s
		lat_minutes = lat_m
		lon_minutes = lon_m
		lat_direction = lat_deg < 0 ? Direction.S : Direction.N
		lon_direction = lon_deg < 0 ? Direction.W : Direction.E

		let lon_deg_range = -90...90
		let lat_deg_range = -180...180
		let minSec_range = 0...59

		if !lat_deg_range.contains(lat_deg) || !lon_deg_range.contains(lon_deg) {
			throw MyExceptions.wrongDeg
		}
		if !minSec_range.contains(lon_minutes) || !minSec_range.contains(lat_minutes) {
			throw MyExceptions.wrongMin
		}
		if !minSec_range.contains(lat_seconds) || !minSec_range.contains(lon_seconds) {
			throw MyExceptions.wrongSec
		}
	}

	func geoStyle() -> String {
		return "\(abs(lat_deg))°\(lat_minutes)\'\(lat_seconds)\"\(lat_direction), \(abs(lon_deg))°\(lon_minutes)\'\(lon_seconds)\"\(lon_direction)"
	}

	func degStyle() -> String {
		return "\(abs(lat_deg + lat_minutes/60 + lat_seconds/3600))°\(lat_direction), \(abs(lon_deg + lon_minutes/60 + lon_seconds/3600))°\(lon_direction) "
	}

	func middlePoint(_ other: CoordinateVN) -> CoordinateVN? {
		if lat_direction == other.lat_direction && lon_direction == other.lon_direction {
			return try! CoordinateVN(
				(lat_deg + other.lat_deg)/2,
				(lon_deg + other.lon_deg)/2,
				(lat_minutes + other.lat_minutes)/2,
				(lon_minutes + other.lon_minutes)/2,
				(lat_seconds + other.lat_seconds)/2,
				(lon_seconds + other.lon_seconds)/2
			)
		} else {
			return nil
		}
	}

	static func middlePoint(_ first: CoordinateVN, _ second: CoordinateVN) -> CoordinateVN? {
		if first.lat_direction == second.lat_direction && first.lon_direction == second.lon_direction {
			return try! CoordinateVN(
				(first.lat_deg + second.lat_deg)/2,
				(first.lon_deg + second.lon_deg)/2,
				(first.lat_minutes + second.lat_minutes)/2,
				(first.lon_minutes + second.lon_minutes)/2,
				(first.lat_seconds + second.lat_seconds)/2,
				(first.lon_seconds + second.lon_seconds)/2
			)
		} else {
			return nil
		}
	}
}

var coord1 = CoordinateVN()
var coord2 = try! CoordinateVN(-6, -6, 6, 6, 6, 6)

print(coord2.geoStyle())
print(coord2.degStyle())

var coordmid = coord2.middlePoint(coord1)
print(coordmid!.degStyle()+"\n"+coordmid!.geoStyle())

var coordmid2 = CoordinateVN.middlePoint(coord2, coord1)
print(coordmid2!.degStyle()+"\n"+coordmid2!.geoStyle())

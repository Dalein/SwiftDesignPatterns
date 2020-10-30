import UIKit


// MARK: - Protocols

protocol CalendarDelegate: class {
    func calendar(_ calendar: Calendar, willDisplay year: Int)
    func calendar(_ calendar: Calendar, didSelect date: Date)
    func calendarShouldChangeYear(_ calendar: Calendar) -> Bool
}

protocol CalendarDataSource: class {
    func calendar(_ calendar: Calendar, eventsFor date: Date) -> [String]
    func calendar(_ calendar: Calendar, add event: String, to date: Date)
}


class Calendar: UIControl {
    weak var delegate: CalendarDelegate?
    weak var dataSource: CalendarDataSource?
    
    
    var selectedDate: Date?
    var currentYear: Int = 2020
    
    
    private func changeDate(to date: Date) {
        selectedDate = date
        delegate?.calendar(self, didSelect: date)
        
        if let items = dataSource?.calendar(self, eventsFor: date) {
            print("Today's events are: ")
            items.forEach({ print($0) })
        } else {
            print("You have no events today")
        }
    }
    
    private func changeYear(to year: Int) {
        if delegate?.calendarShouldChangeYear(self) ?? true {
            delegate?.calendar(self, willDisplay: year)
            currentYear = year
        }
    }
    
    private func add(event: String) {
        guard let selectedDate = selectedDate else { return }
        dataSource?.calendar(self, add: event, to: selectedDate)
    }
    
}


// MARK: - Using

class Reminders {
    var title = "Year: 2020"
    var calendar = Calendar()
    
    private let dataDisplayManager = RemindersCalendarDataSource(events:
        ["Save the world", "Have a break"])
    private let delegate = RemindersCalendarDelegate()
    
    
    init() {
        calendar.delegate = delegate
        calendar.dataSource = dataDisplayManager
    }
    
}

extension Reminders: ReminderPresenting {
    
    func yearChanged(to year: Int) {
        title = "Year: \(year)"
    }
    
}


protocol ReminderPresenting: class {
    func yearChanged(to year: Int)
}

class RemindersCalendarDelegate: CalendarDelegate {
    weak var parentController: ReminderPresenting?
    
    func calendar(_ calendar: Calendar, willDisplay year: Int) {
        parentController?.yearChanged(to: year)
    }
    
    func calendar(_ calendar: Calendar, didSelect date: Date) {
        print("You selected \(date)")
    }
    
    func calendarShouldChangeYear(_ calendar: Calendar) -> Bool {
        true
    }
    
}

class RemindersCalendarDataSource: CalendarDataSource {
    private let events: [String]
    
    
    // MARK: - Init
    
    init(events: [String]) {
        self.events = events
    }
    
    
    // MARK: - CalendarDataSource
    
    func calendar(_ calendar: Calendar, eventsFor date: Date) -> [String] {
        events
    }
    
    func calendar(_ calendar: Calendar, add event: String, to date: Date) {
        print("You are going to \(event) on \(date)")
    }
    
}

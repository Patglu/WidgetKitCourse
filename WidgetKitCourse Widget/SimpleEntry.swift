import WidgetKit

struct SimpleEntry: TimelineEntry {
    let date: Date
    let todos: [Todo] // can be used to schedule updates now 
}

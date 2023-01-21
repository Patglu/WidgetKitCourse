import WidgetKit

struct Provider: TimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), todos: [.placeholder(0),.placeholder(1)])
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        //MARK: - Using the todo service
        Task{
            do{
                let todos = try await TodoService.shared.getAllTodos()
                let fiveTodos = Array(todos.prefix(5))
                let entry = SimpleEntry(date: .now, todos: fiveTodos)
                completion(entry)
            } catch {
                completion(SimpleEntry(date: .now, todos: [.placeholder(0)]))
            }
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        var entries: [SimpleEntry] = []
        ///The completion handler accepts a timeline of entries i
        Task{
            do{
                let allTodo = try await TodoService.shared.getAllTodos()
                let fiveTodos = Array(allTodo.prefix(5)) // returns array slice that's why array is used
                let entry = SimpleEntry(date: .now, todos: fiveTodos)
                //MARK: - Create a timeline
                /// If Your relying on live data from a server , schedule 1-3 entries then have the timeline refresh
                
                ///Update every 30 minutes
                ///But updated when the user opens the home screen
                let timeline =  Timeline(entries: [entry], policy: .after(.now.advanced(by: 60 * 60 * 30)))
                
                completion(timeline)
            } catch {
                //MARK: - placeholder data
                let entries = [SimpleEntry(date: .now, todos: [.placeholder(0)])]
                let timeline =  Timeline(entries: entries, policy: .after(.now.advanced(by: 60 * 60 * 30)))
                
                completion(timeline)
            }
        }
    }
}

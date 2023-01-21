import WidgetKit
import SwiftUI

struct MeduimSizeView: View {
    var entry: SimpleEntry

    var body: some View {
        GroupBox {
            HStack{
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.secondary)
                
                Divider()
                
                if let todo = entry.todos.first {
                    VStack(alignment: .leading){
                        Text(todo.title)
                            .font(.headline)
                        
                        Text(todo.completed ? "Completed" : "Open")
                            .font(.subheadline)
                    }
                }
                Spacer()
            }
            .padding()
        } label: {
            Label("My Todos", image: "list.dash")
        }
        .widgetURL(URL(string: "myapp://todo/\(entry.todos.first?.id ?? 0)"))
    }
}

struct MeduimSizeView_Widget_Previews: PreviewProvider {
    static var previews: some View {
        MeduimSizeView(entry: SimpleEntry(date: Date(), todos: [.placeholder(0)]))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        
    }
}

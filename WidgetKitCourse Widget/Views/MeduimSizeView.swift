
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
                
                VStack(alignment: .leading){
                    Text("Todo title")
                        .font(.headline)
                    
                    Text("Completed")
                        .font(.subheadline)
                }
                Spacer()
            }
            .padding()
        } label: {
            Label("My Todos", image: "list.dash")
        }
        .widgetURL(URL(string: "myapp://todo/1"))
    }
}

struct MeduimSizeView_Widget_Previews: PreviewProvider {
    static var previews: some View {
        MeduimSizeView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        
    }
}

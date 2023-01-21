
import WidgetKit
import SwiftUI

struct LargeSizeView: View {
    var entry: SimpleEntry

    var body: some View {
        VStack{
            HStack(spacing: 16) {
                Text("My Todos")
                Text(Date.now, format: .dateTime)
                Spacer()
            }
            .padding(8)
            .background(.blue)
            .foregroundColor(.white)
            .clipped() // Applies the shadow to only the hstack and not the sub view
            .shadow(color: .blue.opacity(0.5), radius: 10, x: 1, y: 2)
            
            ForEach(0..<5, id: \.self) { _ in
                Link(destination: URL(string: "myapp://todo/1")!) {
                    HStack{
                        Circle()
                            .stroke(lineWidth: 2)
                            .frame(width: 30, height: 30)
                            .overlay {
                                if true {
                                    Image(systemName: "checkmark")
                                }
                            }
                        Text("Todo title")
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                
                Divider()
            }
            Spacer()
        }
    }
}

struct LargeSizeView_Widget_Previews: PreviewProvider {
    static var previews: some View {
        LargeSizeView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
        
    }
}

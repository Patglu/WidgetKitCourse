
import WidgetKit
import SwiftUI

struct WidgetView: View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry

    var body: some View {
        switch widgetFamily{
        case .systemMedium :
            MeduimSizeView(entry: entry)
        case .systemLarge :
            LargeSizeView(entry: entry)
        default:
            Text(entry.date, style: .time)
        }
    }
}


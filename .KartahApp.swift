
import SwiftUI

@main
struct KartahApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Kartah")
                .font(.system(size: 38, weight: .bold))

            Text("كيبورد سريع وخفيف")
                .font(.system(size: 18))

            Text("بدون تصحيح تلقائي أو اقتراح كلمات")
                .font(.system(size: 14))
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
}

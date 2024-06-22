import SwiftUI


struct ContentView: View {
    
    @State private var icon_info = getRandomizedIcon()
    
    var body: some View {
        ScrollView {
            VStack {
                MapView()
                    .frame(height: 550)
                
                CircleImage(icon_info: self.$icon_info)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                VStack(alignment: .leading) {
                    Text("John Doe")
                        .font(.title)
                    HStack {
                        Text(self.icon_info[1].capitalized)
                            .font(.subheadline)
                        Spacer()
                        Text("📍Boulder, CO")
                            .font(.subheadline)
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    
                    Divider()
                    
                    Text(self.icon_info[2])
                }
                .padding()
            }
        }
    }
}


#Preview {
    ContentView()
}

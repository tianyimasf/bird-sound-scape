import SwiftUI


struct ContentView: View {
    
    @State private var icon_info = getRandomizedIcon()
    
    var body: some View {
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

                Text("About Your Featured Bird")
                    .font(.title2)
                Text("Some bird description.")
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}

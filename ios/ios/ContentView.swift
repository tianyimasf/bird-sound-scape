import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)

            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("John Doe")
                    .font(.title)
                HStack {
                    Text("Level 1, Bird Guardian")
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
            
            Spacer()
        }
    }
}


#Preview {
    ContentView()
}

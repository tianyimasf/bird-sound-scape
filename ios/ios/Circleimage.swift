import SwiftUI

struct CircleImage: View {
    
    @Binding var icon_info: [String]

    var body: some View {
        
        VStack {
            Image(self.icon_info[0])
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
        }
        
    }
    
}

/*
#Preview {
    CircleImage()
}*/

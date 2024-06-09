import SwiftUI

func getAllImageFiles() -> [String] {
    
    var imageFiles: [String] = []

    if let filepath = Bundle.main.path(forResource: "bird_icon_names", ofType: "txt") {
        guard let file = freopen(filepath, "r", stdin) else {
            return []
        }
        defer {
            fclose(file)
        }

        while let line = readLine() {
            imageFiles.append(line)
        }
    } else {
        print("File not found")
    }

    return imageFiles
}

func getRandomizedIcon() -> [String] {
    
    let imageFiles = getAllImageFiles()
    
    let numOfImages = imageFiles.count
    
    let chosenImageIndex = Int(arc4random_uniform(UInt32(numOfImages)))
    
    let filename = imageFiles[chosenImageIndex]
    let species_name = filename.split(separator: "-")[0]
    
    return [filename, String(species_name)]
}

struct CircleImage: View {
    
    let icon_info = getRandomizedIcon()

    var body: some View {
        
        VStack {
            Image(icon_info[0])
                .frame(width: 185, height: 185)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
                .padding()
            
            Text(icon_info[1].capitalized)
                .font(.title3)
        }
        
    }
    
}


#Preview {
    CircleImage()
}

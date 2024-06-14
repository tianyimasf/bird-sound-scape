import Foundation

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

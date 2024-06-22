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

struct Post : Codable {

    var PostTitle: String

    private enum CodingKeys : String, CodingKey {
        case PostTitle = "Post Title"
    }
}

func getRandomizedIcon() -> [String] {
    
    let imageFiles = getAllImageFiles()
    
    let numOfImages = imageFiles.count
    
    let chosenImageIndex = Int(arc4random_uniform(UInt32(numOfImages)))
    
    let filename = imageFiles[chosenImageIndex]
    let species_name = String(filename.split(separator: "-")[0])
    
    if let filepath = Bundle.main.path(forResource: species_name, ofType: "txt") {
        guard let file = freopen(filepath, "r", stdin) else {
            return [filename, String(species_name), ""]
        }
        defer {
            fclose(file)
        }
        
        let desc = readLine()!
        return [filename, String(species_name), desc]
    } else {
        print("File not found")
        return [filename, String(species_name), ""]
    }
}

func readJSONFile<T: Decodable>(with url: URL) throws -> T {
    let data = try Data(contentsOf: url)
    return try JSONDecoder().decode(T.self, from: data)
}

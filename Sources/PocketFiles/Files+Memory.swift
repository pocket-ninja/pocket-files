import Foundation

extension Files {
    enum FilesError: Error {
        case fileDoesntExist(String)
    }
    
    public static func inMemory() -> Self {
        var memory: [String: Data] = [:]
        
        return Self(
            existsAtPath: { path in
                memory[path] != nil
            },
            readDataAtPath: { path in
                if let file = memory[path] {
                    return file
                }
                
                throw FilesError.fileDoesntExist(path)
            },
            writeDataToPath: { data, path in
                memory[path] = data
            },
            deleteAtPath: { path in
                memory.removeValue(forKey: path)
            }
        )
    }
}

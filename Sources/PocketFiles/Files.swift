import Foundation

public struct Files {
    public var existsAtPath: (String) -> Bool
    public var readDataAtPath: (String) throws -> Data
    public var writeDataToPath: (Data, String) throws -> Void
    public var deleteAtPath: (String) throws -> Void

    init(
        existsAtPath: @escaping (String) -> Bool,
        readDataAtPath: @escaping (String) throws -> Data,
        writeDataToPath: @escaping (Data, String) throws -> Void,
        deleteAtPath: @escaping (String) throws -> Void
    ) {
        self.existsAtPath = existsAtPath
        self.readDataAtPath = readDataAtPath
        self.writeDataToPath = writeDataToPath
        self.deleteAtPath = deleteAtPath
    }
}

extension Files {
    func exists(at filePath: String) -> Bool {
        existsAtPath(filePath)
    }

    func readData(at filePath: String) throws -> Data {
        try readDataAtPath(filePath)
    }

    func write(data: Data, to filePath: String) throws {
        try writeDataToPath(data, filePath)
    }

    func delete(at filePath: String) throws {
        try deleteAtPath(filePath)
    }
}

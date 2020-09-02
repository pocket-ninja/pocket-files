@testable import PocketFiles
import XCTest

final class InMemoryTests: XCTestCase {
    let path = "path"
    let data = "Hello".data(using: .utf8)!
    
    func testWritesFile() throws {
        let files = Files.inMemory()
        
        XCTAssertFalse(files.exists(at: path))
        
        try files.write(data: data, to: path)
        
        XCTAssertTrue(files.exists(at: path))
        XCTAssertEqual(try files.readData(at: path), data)
    }
    
    func testDeletesFiles() throws {
        let files = Files.inMemory()
        
        try files.write(data: data, to: path)
        try files.delete(at: path)
        XCTAssertFalse(files.exists(at: path))
    }
}

import Foundation

extension Files {
    public static let live = Self(
        existsAtPath: { path in
            manager.fileExists(atPath: path)
        },
        readDataAtPath: { path in
            try Data(contentsOf: URL(fileURLWithPath: path))
        },
        writeDataToPath: { data, path in
            try? manager.createDirectory(
                atPath: path.deletetingLastPathComponent(),
                withIntermediateDirectories: true
            )

            try data.write(to: URL(fileURLWithPath: path), options: .atomic)
        },
        deleteAtPath: { path in
            if manager.fileExists(atPath: path) {
                try manager.removeItem(atPath: path)
            }
        }
    )

    private static let manager = FileManager.default
}

private extension String {
    func deletetingLastPathComponent() -> String {
        NSString(string: self).deletingLastPathComponent
    }
}

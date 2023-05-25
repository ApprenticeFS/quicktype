// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let swiftOutput = try SwiftOutput(json)

import Foundation

// MARK: - SwiftOutput
struct SwiftOutput: Codable {
    let id, title: String
    let type: MediaTypeEnum
    let url: URL
}

// MARK: SwiftOutput convenience initializers and mutators

extension SwiftOutput {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(SwiftOutput.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: String? = nil,
        title: String? = nil,
        type: MediaTypeEnum? = nil,
        url: URL? = nil
    ) -> SwiftOutput {
        return SwiftOutput(
            id: id ?? self.id,
            title: title ?? self.title,
            type: type ?? self.type,
            url: url ?? self.url
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum MediaTypeEnum: String, Codable {
    case image = "image"
    case video = "video"
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

import Foundation

/// This is the element for the resources copy build phase.
public final class PBXResourcesBuildPhase: PBXBuildPhase {
    override public var buildPhase: BuildPhase {
        .resources
    }
}

// MARK: - PBXResourcesBuildPhase Extension (PlistSerializable)

extension PBXResourcesBuildPhase: PlistSerializable {
    func plistKeyAndValue(proj: PBXProj, reference: String) throws -> (key: CommentedString, value: PlistValue) {
        var dictionary: [CommentedString: PlistValue] = try plistValues(proj: proj, reference: reference)
        dictionary["isa"] = .string(CommentedString(PBXResourcesBuildPhase.isa))
        return (key: CommentedString(reference, comment: "Resources"), value: .dictionary(dictionary))
    }
}

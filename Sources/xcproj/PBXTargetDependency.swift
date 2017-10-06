import Foundation

// This is the element for referencing other target through content proxies.
public class PBXTargetDependency: PBXObject, Hashable {
    
    // MARK: - Attributes
    
    /// Target reference.
    public var target: String
    
    /// Target proxy
    public var targetProxy: String
    
    // MARK: - Init
    
    /// Initializes the target dependency.
    ///
    /// - Parameters:
    ///   - reference: element reference.
    ///   - target: element target.
    ///   - targetProxy: element target proxy.
    public init(reference: String,
                target: String,
                targetProxy: String) {
        self.target = target
        self.targetProxy = targetProxy
        super.init(reference: reference)
    }
    
    // MARK: - Hashable
    
    public static func == (lhs: PBXTargetDependency,
                           rhs: PBXTargetDependency) -> Bool {
        return lhs.reference == rhs.reference &&
        lhs.target == rhs.target &&
        lhs.targetProxy == rhs.targetProxy
    }
    
    // MARK: - Decodable
    
    fileprivate enum CodingKeys: String, CodingKey {
        case target
        case targetProxy
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.target = try container.decode(.target)
        self.targetProxy = try container.decode(.targetProxy)
        try super.init(from: decoder)
    }
    
}

// MARK: - PlistSerializable

extension PBXTargetDependency: PlistSerializable {
    
    func plistKeyAndValue(proj: PBXProj) -> (key: CommentedString, value: PlistValue) {
        var dictionary: [CommentedString: PlistValue] = [:]
        dictionary["isa"] = .string(CommentedString(PBXTargetDependency.isa))
        dictionary["target"] = .string(CommentedString(target, comment: proj.nativeTargets.getReference(target)?.name))
        dictionary["targetProxy"] = .string(CommentedString(targetProxy, comment: "PBXContainerItemProxy"))
        return (key: CommentedString(self.reference,
                                                 comment: "PBXTargetDependency"),
                value: .dictionary(dictionary))
    }
}

import ProjectDescription

public extension TargetScript {
    static let swiftLint = TargetScript.pre(
        path: Path.relativeToRoot("Scripts/SwiftLintRunScript.sh"),
        name: "SwiftLint"
    )
    
    static let Needle = TargetScript.pre(
        path: Path.relativeToRoot("Scripts/NeedleRunScript.sh"),
        name: "Needle"
    )
    
    static func needleGenerateScript() -> TargetScript {
      return .pre(
        script: """
        FILE_PATH="$SRCROOT/Demo/Sources/AppStart"
        export PATH="$PATH:/opt/homebrew/bin"
        export SOURCEKIT_LOGGING=0 && needle generate "${FILE_PATH}/NeedleGenerated.swift" \
        "$SRCROOT/../" \
        --exclude-suffixes Tests Mocks \
        --exclude-paths /Sample /Tests /Resources
        """,
        name: "Needle"
      )
    }
}

generate:
	tuist fetch
	tuist generate

ci_generate:
	tuist fetch
	TUIST_CI=1 tuist generate

clean:
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace

reset:
	tuist clean
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace

module:
	swift Scripts/GenerateModule.swift

dependency:
	swift Scripts/NewDependency.swift

init:
	swift Scripts/InitEnvironment.swift

signing:
	swift Scripts/CodeSigning.swift
	
gen:
	needle generate Projects/App/Sources/AppStart/NeedleGenerated.swift Projects/ --exclude-suffixes Tests Mocks --exclude-paths /Demo /Tests /Resources

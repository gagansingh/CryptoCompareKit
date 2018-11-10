XCODEBUILD := xcodebuild
WORKSPACE = CryptoCompareKit.xcworkspace
BUILD_FLAGS = -workspace $(WORKSPACE) -scheme $(SCHEME) -destination $(DESTINATION)
SCHEME ?= $(TARGET)
TARGET ?= CryptoCompareKit
PLATFORM ?= iOS
OS ?= 12.1
RELEASE ?= release
BRANCH ?= master
DIST_BRANCH = $(RELEASE)-dist

ifeq ($(PLATFORM), iOS)
	DESTINATION ?= 'platform=iOS Simulator,name=iPhone XR,OS=12.1'
endif

XCPRETTY :=
ifneq ($(shell type -p xcpretty),)
	XCPRETTY += | xcpretty -c && exit $${PIPESTATUS[0]}
endif

build: dependencies
	$(XCODEBUILD) $(BUILD_FLAGS) $(XCPRETTY)

test:
	$(XCODEBUILD) test $(BUILD_FLAGS) $(XCPRETTY)

clean:
	$(XCODEBUILD) clean $(BUILD_FLAGS) $(XCPRETTY)

bootstrap: dependencies
	brew update || brew update
	brew unlink swiftlint || true
	brew install swiftlint
	brew link --overwrite swiftlint

dependencies: cocoapods

cocoapods:
	pod repo update
	pod install

lint:
	swiftlint lint --reporter json --strict

.PHONY: test clean dependencies lint cocoapods
XCODEBUILD := xcodebuild
WORKSPACE = CryptoCompareKit.xcworkspace
BUILD_FLAGS = -workspace $(WORKSPACE) -scheme $(SCHEME) -destination $(DESTINATION)
SCHEME ?= $(TARGET)
TARGET ?= CryptoCompareKit
PLATFORM ?= iOS

ifeq ($(PLATFORM), iOS)
	DESTINATION ?= 'platform=iOS Simulator,name=iPhone 7,OS=12.0'
endif

XCPRETTY :=
ifneq ($(shell type -p xcpretty),)
	XCPRETTY += | xcpretty -c && exit $${PIPESTATUS[0]}
endif

build: dependencies
	$(XCODEBUILD) $(BUILD_FLAGS) $(XCPRETTY)

test:
	$(XCODEBUILD) test $(BUILD_FLAGS) -enableCodeCoverage YES $(XCPRETTY)

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

documentation:
    @jazzy \
        --min-acl internal \
        --no-hide-documentation-coverage \
        --theme fullwidth \
        --output ./docs \
        --documentation=./*.md

.PHONY: test clean dependencies lint cocoapods
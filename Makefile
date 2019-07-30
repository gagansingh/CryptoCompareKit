XCODEBUILD := xcodebuild
WORKSPACE = CryptoCompareKit.xcworkspace
BUILD_FLAGS = -workspace $(WORKSPACE) -scheme $(SCHEME) -destination $(DESTINATION)
SCHEME ?= $(TARGET)
TARGET ?= CryptoCompareKit
PLATFORM ?= iOS

ifeq ($(PLATFORM), iOS)
	DESTINATION ?= 'platform=iOS Simulator,name=iPhone 8,OS=12.2'
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

bootstrap:
	brew install swiftlint

lint:
	swiftlint lint --reporter json --strict

documentation:
	@jazzy \
            --min-acl internal \
            --no-hide-documentation-coverage \
            --theme fullwidth \
            --output ./docs \
            --documentation=./*.md
	@rm -rf ./build

.PHONY: test clean dependencies lint cocoapods
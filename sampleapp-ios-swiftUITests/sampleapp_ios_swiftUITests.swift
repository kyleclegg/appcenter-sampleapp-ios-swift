
import XCTest
import AppCenterXCUITestExtensions

class sampleapp_ios_swiftUITests: XCTestCase {
    let app = ACTLaunch.launch()!
    override func setUp() {
        super.setUp()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testBuildLabelExists() {
        
        let app = XCUIApplication()
                let element3 = app.otherElements.containing(.pageIndicator, identifier:"page 1 of 7").children(matching: .other).element
        let element = element3.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.swipeLeft()
        XCTAssertTrue(XCUIApplication().staticTexts["Build"].exists)
        XCTAssertFalse(XCUIApplication().staticTexts["Buildy"].exists)
        
    }
}

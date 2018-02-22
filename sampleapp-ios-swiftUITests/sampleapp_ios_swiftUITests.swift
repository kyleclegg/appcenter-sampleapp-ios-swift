
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

    func testBuildScreenTitle() {
        let elementPage1 = app.otherElements.containing(.pageIndicator, identifier:"page 1 of 7").children(matching: .other).element
        let element = elementPage1.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.swipeLeft()
        XCTAssertTrue(XCUIApplication().staticTexts["Build"].exists)
        XCTAssertFalse(XCUIApplication().staticTexts["Buildy"].exists)
    }
    
    func testForceCrashButton() {
        app.otherElements.containing(.pageIndicator, identifier:"page 1 of 7").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        XCTAssertTrue(XCUIApplication().staticTexts["Build"].waitForExistence(timeout: 3.0))
        app.otherElements.containing(.pageIndicator, identifier:"page 2 of 7").children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.swipeLeft()
        XCTAssertTrue(XCUIApplication().staticTexts["Test"].waitForExistence(timeout: 3.0))
        app.otherElements.containing(.pageIndicator, identifier:"page 3 of 7").children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.swipeLeft()
        XCTAssertTrue(XCUIApplication().staticTexts["Distribute"].waitForExistence(timeout: 3.0))
        app.otherElements.containing(.pageIndicator, identifier:"page 4 of 7").children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.swipeLeft()
        XCTAssertTrue(XCUIApplication().staticTexts["Crashes"].waitForExistence(timeout: 3.0))
        
        app/*@START_MENU_TOKEN@*/.buttons["fatalErrorButton"]/*[[".buttons[\"Send a sample crash\"]",".buttons[\"fatalErrorButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["The app will close"].buttons["Cancel"].tap()
        XCTAssertTrue(XCUIApplication().staticTexts["Crashes"].exists)
    }
    
}

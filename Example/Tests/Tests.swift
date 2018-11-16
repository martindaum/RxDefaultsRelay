import XCTest
@testable import RxDefaultsRelay

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        UserDefaults.standard.removeObject(forKey: "test")
        super.tearDown()
    }
    
    func testExample() {
        let defaults = UserDefaults.standard
        let key = "test"
        let relay = DefaultsRelay<String>(defaults: defaults, key: key, defaultValue: "Herbert")
        XCTAssertEqual(relay.value, "Herbert")
        XCTAssertNil(defaults.data(forKey: key))
        relay.accept("Gustav")
        XCTAssertEqual(relay.value, "Gustav")
        XCTAssertNotNil(defaults.value(forKey: key))
    }
    
    func testOptionalExample() {
        let defaults = UserDefaults.standard
        let key = "test"
        let relay = DefaultsRelay<String?>(defaults: defaults, key: key, defaultValue: "Herbert")
        XCTAssertEqual(relay.value, "Herbert")
        XCTAssertNil(defaults.data(forKey: key))
        relay.accept("Gustav")
        XCTAssertEqual(relay.value, "Gustav")
        XCTAssertNotNil(defaults.value(forKey: key))
        relay.accept(nil)
        XCTAssertEqual(relay.value, "Herbert")
        XCTAssertNil(defaults.value(forKey: key))
    }
    
    func testNilExample() {
        let defaults = UserDefaults.standard
        let key = "test"
        let relay = DefaultsRelay<String?>(defaults: defaults, key: key, defaultValue: nil)
        XCTAssertNil(relay.value)
        XCTAssertNil(defaults.data(forKey: key))
        relay.accept("Gustav")
        XCTAssertEqual(relay.value, "Gustav")
        XCTAssertNotNil(defaults.value(forKey: key))
        relay.accept(nil)
        XCTAssertNil(relay.value)
        XCTAssertNil(defaults.value(forKey: key))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}

import Testing
@testable import xxPROJECTxNAMExx

@Test func testGreeting() async throws {
    let greeting = xxPROJECTxNAMExx.greet("World")
    #expect(greeting.contains("Hello, World!"))
    #expect(greeting.contains(xxPROJECTxNAMExx.name))
}

@Test func testWhiteKing() async throws {
    let king = xxPROJECTxNAMExx.whiteKing()
    #expect(king == "♔")
}

@Test func testModuleName() async throws {
    #expect(xxPROJECTxNAMExx.name == "xxPROJECTxNAMExx")
}

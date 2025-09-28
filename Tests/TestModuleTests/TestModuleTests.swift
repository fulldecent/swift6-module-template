import Testing

@testable import TestModule

@Test func testGreeting() async throws {
  let greeting = TestModule.greet("World")
  #expect(greeting.contains("Hello, World!"))
  #expect(greeting.contains(TestModule.name))
}

@Test func testWhiteKing() async throws {
  let king = TestModule.whiteKing()
  #expect(king == "♔")
}

@Test func testModuleName() async throws {
  #expect(TestModule.name == "TestModule")
}

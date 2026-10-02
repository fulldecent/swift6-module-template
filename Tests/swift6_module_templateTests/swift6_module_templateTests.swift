import Testing

@testable import swift6_module_template

@Test func testGreeting() async throws {
  let greeting = swift6_module_template.greet("World")
  #expect(greeting.contains("Hello, World!"))
  #expect(greeting.contains(swift6_module_template.name))
}

@Test func testWhiteKing() async throws {
  let king = swift6_module_template.whiteKing()
  #expect(king == "♔")
}

@Test func testModuleName() async throws {
  #expect(swift6_module_template.name == "swift6_module_template")
}

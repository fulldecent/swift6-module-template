import Testing

@testable import swift6_module_template

@Test func testGreeting() async throws {
  let greeting = swift6_module_template.greet("World")
  #expect(greeting.contains("Hello, World!"))
  #expect(greeting.contains(swift6_module_template.name))
}

@Test func testWhitePawn() async throws {
  let pawn = swift6_module_template.whitePawn()
  #expect(pawn == "♙")
}

@Test func testModuleName() async throws {
  #expect(swift6_module_template.name == "swift6_module_template")
}

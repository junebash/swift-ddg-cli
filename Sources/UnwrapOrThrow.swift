extension Optional {
  public struct UnwrapError: Error {}

  public func orThrow() throws -> Wrapped {
    guard let value = self else { throw UnwrapError() }
    return value
  }

  public func orThrow(_ error: @autoclosure () throws -> any Error) throws -> Wrapped {
    guard let value = self else { throw try error() }
    return value
  }
}

extension Bool {
  public struct UnexpectedFalse: Error {}

  public func assert() throws {
    guard self else { throw UnexpectedFalse() }
  }

  public func assert(orThrow error: @autoclosure () throws -> any Error) throws {
    guard self else { throw try error() }
  }
}

public func assert(
  _ assertion: @autoclosure () throws -> Bool,
  orThrow error: @autoclosure () throws -> any Error
) throws {
  guard try assertion() else { throw try error() }
}

public func assertOrThrow(_ assertion: @autoclosure () throws -> Bool) throws {
  guard try assertion() else { throw Bool.UnexpectedFalse() }
}

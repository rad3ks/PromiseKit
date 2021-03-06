import Foundation
import PromiseKit
import XCPlayground


Promise(1).then { _ in
    return true
}.then {
    return 2
}.then {
    return Promise(3)
}.then { x -> AnyPromise in
    print(x)
    return AnyPromise(bound: Promise(1))
}.then {
    print($0)
}



firstly {
    return Promise(1)
}.then { _ in
    return 2
}.then {
    return Promise(3)
}.error { error in
    switch error {
    case Error.When(let index, NSURLError.Cancelled):
        break
    default:
        break
    }
}

Promise<Int>(error: Error.When(1, NSURLError.CannotFindHost)).error { error in
    do {
        throw error
    } catch NSURLError.CannotFindHost {
        //…
    } catch {
        //…
    }
}

//TODO this should not work
after(0.1).then { Error.DoubleOhSux0r }


XCPSetExecutionShouldContinueIndefinitely()



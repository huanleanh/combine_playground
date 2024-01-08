import Combine
import Foundation


//The creation operators in Combine Swift are used to create publishers that emit values or events. These operators allow you to create publishers from various sources such as arrays, sequences, timers, and more. Here are some examples of creation operators in Combine Swift:

//JUST
let justPublisher = Just("Hello, World!").sink { value in
    print("Receive: ", value)
}

//ERROR
enum MyError: Error {
    case customError
}

let failPublisher = Fail(outputType: String.self, failure: MyError.customError)
    .sink(receiveCompletion: { completion in
        if case .failure(let failure) = completion {
            print("Got failure: ", failure)
        } else if case .finished = completion {
            print("Everything ended successfully")
        }
    }, receiveValue: { value in
        print("Receive value: ", value)
    })

//EMPTY
let emptyPublisher = Empty<Int, Never>()

emptyPublisher
    .sink(receiveValue: {
        value in
        print("Got value: ", value)
    })


//SEQUENCE
let sequencePublisher = Publishers.Sequence<[Int], Never>(sequence: [1, 2, 3, 4, 5])
    .sink(receiveValue: { value in
        print("receive: ", value)
    })

//TIMER
let timerPublisher = Timer.publish(every: 1.0, on: .main, in: .default)
    .autoconnect()
    .sink(receiveValue: {
        value in
        print("Timer sink: ", value)
    })


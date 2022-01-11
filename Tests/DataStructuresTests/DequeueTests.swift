import XCTest
@testable import DataStructures

final class DequeueTests: XCTestCase {
    
    enum DequeueTestError: Error {
        case invalid
    }
    
    func testEnqueueDequeueAllItems() throws {
        // Given
        let expectedItemsRemoved = [1,2,3,4,5,6,7]
        let remainingItemsCount = Int.zero
        let items = [1,2,3,4,5,6,7]
        let dequeue = Dequeue<Int>()
        var itemsRemoved = [Int]()
        
        // When
        for item in items {
            dequeue.enqueue(item)
        }
        for _ in 0..<expectedItemsRemoved.count {
            guard let value = dequeue.dequeue() else {
                throw DequeueTestError.invalid
            }
            itemsRemoved.append(value)
        }
        
        // Then
        XCTAssertEqual(itemsRemoved, expectedItemsRemoved)
        XCTAssertEqual(remainingItemsCount, dequeue.count)
        XCTAssertTrue(dequeue.isEmpty)
    }
    
    func testEnqueueDequeueWithRemainingItems() throws {
        // Given
        let expectedItemsRemoved = [1,2,3,4]
        let remainingItemsCount = 3
        let items = [1,2,3,4,5,6,7]
        let dequeue = Dequeue<Int>()
        var itemsRemoved = [Int]()
        
        // When
        for item in items {
            dequeue.enqueue(item)
        }
        for _ in 0..<expectedItemsRemoved.count {
            guard let value = dequeue.dequeue() else {
                throw DequeueTestError.invalid
            }
            itemsRemoved.append(value)
        }
        
        // Then
        XCTAssertEqual(itemsRemoved, expectedItemsRemoved)
        XCTAssertEqual(remainingItemsCount, dequeue.count)
        XCTAssertFalse(dequeue.isEmpty)
    }
    
}

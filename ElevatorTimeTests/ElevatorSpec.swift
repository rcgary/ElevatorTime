import Quick
import Nimble
@testable import ElevatorTime

class ElevatorSpec: QuickSpec {
    override func spec() {
        
        describe("#init") {
            it("should init with the raw data") {
                let elevator = Elevator(id: "A", currentLvl: 0)
                expect(elevator.id) == "A"
                expect(elevator.currentLvl) == 0
                expect(elevator.availableCount) == 20
                expect(elevator.capacity) == 20
                expect(elevator.passengers.count) == 0
                expect(elevator.destinations.count) == 0
                expect(elevator.direction.rawValue) == Direction.Stationary.rawValue
            }
        }
    }
}

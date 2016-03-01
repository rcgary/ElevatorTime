import Quick
import Nimble
@testable import ElevatorTime

class PassengerSpec: QuickSpec {
    override func spec() {
        describe("#init") {
            it("should have a driction") {
                let upPassenger = Passenger(from: 0, to: 4)
                expect(upPassenger.direction.rawValue) == Direction.Up.rawValue
                let downPassenger = Passenger(from: 10, to: 4)
                expect(downPassenger.direction.rawValue) == Direction.Down.rawValue
            }
        }
    }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
    @title Room Rental
    @dev basically a decentralized version of airbnb
 */
contract RoomRental {
    enum Status { Vacant, Occupied }
    address private owner;

    struct Room { 
        Status status;
        uint256 cost;
    }

    struct Rental { 
        Room room;
        uint256 departure;
        bool checkout;
    }

    event Occupy(address _guest);
    event StayFinished(address _guest);

    Room public currentRoom;
    mapping(address => Rental) public rentals; 

    constructor(uint256 _cost, uint256 checkoutDate) {
        owner = msg.sender;
        currentRoom = Room(Status.Vacant, _cost);
    }

    function bookRoom(uint256 _roomNum, uint256 _lenOfStay) external payable {
        address guest = msg.sender;
        Room memory chosen = rentals[msg.sender].room;
        
        require(chosen.status == Status.Vacant, "room is currently occupied");
        require(chosen.cost >= msg.value, "Not enough to book room");

        
        chosen.status = Status.Occupied;
        rentals[guest] = Rental(chosen, block.timestamp + _lenOfStay);
    
        emit Occupy(guest);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function checkout() public {
        if(block.timestamp >= rentals[msg.sender].checkout) {
            rentals[msg.sender].room.status = Status.Vacant;
            emit StayFinished(msg.sender);
        }
    }
}
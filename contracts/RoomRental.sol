// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract RoomRental {
    enum Status { Vacant, Occupied }
    Status currentStatus;
    address payable public owner;

    struct Room { 
        Status status;
        uint256 cost;
        uint256 exitDate;
    }

    event Occupy(address _guest, Room room);

    mapping(address => Room) rentals;

    constructor() public {
        owner = msg.sender;
    }

    function getRooms() public view returns(Room[]) {
        return rentals;
    }

    modifier roomIsVacant {
        require(rentals[msg.sender].status == Status.Vacant, "room is currently occupied");
        _;
    }

    modifier hasEnough {
        require(rentals[msg.sender].cost >= msg.value, "Not enough to book room");
        _;
    }

    receive() external payable roomAvailable hasEnough {
        owner.transfer(msg.value);
        rentals[msg.sender].status = Status.Occupied;
        emit(Occupy(msg.sender, rentals[msg.sender]))
    }

    function leaveStay() public {
        
    }
}
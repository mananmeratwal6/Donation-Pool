//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DonationPool {
    address payable public charity;
    mapping(address => uint256) public donations;
    uint256 public totalDonations;

    function donate() public payable {
        require(msg.value > 0, "Donation must be greater than zero");
        donations[msg.sender] += msg.value;
        totalDonations += msg.value;
    }

    function withdraw() public {
        require(msg.sender == charity, "Only the charity can withdraw");
        uint256 amount = address(this).balance;
        require(amount > 0, "No funds to withdraw");
        charity.transfer(amount);
    }
}

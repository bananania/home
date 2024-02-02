// /contracts/Lottery.sol
pragma solidity ^0.4.22;

contract Lottery {
    address public owner;
    address[] public players;

    modifier ownerOnly() {
        require(msg.sender == owner);
        _;
    }

    function owner() public ownerOnly {
        owner = msg.sender;
    }
    function enter() public payable {
        require(msg.value > .0001 ether);
        players.push(msg.sender);
    }
    // 1 - 隨機挑選(helper function)
    function random() private view returns (uint) {
        // 2 - 
        return uint(keccak256(block.difficulty, now, players));
    }
    function pickWinner() public ownerOnly {
        // 3 - 挑選贏家
        uint index = random() % players.length;
        players[index].transfer(address(this).balance);
        // 4 - Reset
        players = new address[](0);
    }
    function getPlayers() public view returns (address[]) {
        return players;
    }
}
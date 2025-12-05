// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {

    // Token metadata - define these as public state variables
    string public name = "MyToken";
    string public symbol = "MTK";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    // Mapping to track balances: address => balance
    mapping(address => uint256) public balanceOf;

    // Nested mapping for allowances: owner => (spender => amount)
    mapping(address => mapping(address => uint256)) public allowance;
    // Event that is emitted when tokens are transferred
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Event that is emitted when an approval is set
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // Constructor to initialize total supply and assign to creator
    constructor(uint256 _totalSupply) {
        // Set totalSupply from parameter
        totalSupply = _totalSupply;

        // Assign entire supply to msg.sender (contract creator)
        balanceOf[msg.sender] = _totalSupply;
    }
    // Function to transfer tokens to another address
    function transfer(address _to, uint256 _value) public returns (bool success) {

    // Check if the sender has enough balance
    require(balanceOf[msg.sender] >= _value, "Not enough balance");

    // Deduct from sender
    balanceOf[msg.sender] -= _value;

    // Add to receiver
    balanceOf[_to] += _value;

    // Emit transfer event
    emit Transfer(msg.sender, _to, _value);

    return true;
}
    function approve(address _spender, uint256 _value) public returns (bool success) {
    // Validate spender is not zero address
    require(_spender != address(0), "Cannot approve zero address");

    // Set allowance for spender
    allowance[msg.sender][_spender] = _value;

    // Emit Approval event
    emit Approval(msg.sender, _spender, _value);

    return true;
}
function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
    // Validate recipient is not zero address
    require(_to != address(0), "Cannot transfer to zero address");

    // Validate owner has enough balance
    require(balanceOf[_from] >= _value, "Insufficient balance");

    // Validate caller has enough allowance
    require(allowance[_from][msg.sender] >= _value, "Insufficient allowance");

    // Subtract from owner's balance
    balanceOf[_from] -= _value;

    // Add to recipient's balance
    balanceOf[_to] += _value;

    // Decrease allowance
    allowance[_from][msg.sender] -= _value;

    // Emit Transfer event
    emit Transfer(_from, _to, _value);

    return true;
}
function getTotalSupply() public view returns (uint256) {
    return totalSupply;
}
function getTokenInfo() public view returns (string memory, string memory, uint8, uint256) {
    return (name, symbol, decimals, totalSupply);
}

}

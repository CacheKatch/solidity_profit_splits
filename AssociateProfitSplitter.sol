pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;
    address ownerAddress = 0xbad5BD482eBaE4D8af4eBe12F3D5C6b361932691;
    uint public amount2 = msg.value;
    
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        require(msg.sender == ownerAddress, "you are not authorized to make transactions from this contract");
        // @TODO: Split `msg.value` into three
        uint amount = msg.value; // Your code here!
        uint splitValue = amount / 3;

        // @TODO: Transfer the amount to each employee
        // Your code here!
        employee_one.transfer(splitValue);
        employee_two.transfer(splitValue);
        employee_three.transfer(splitValue);
        

        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        // Your code here!
        msg.sender.transfer(msg.value-(splitValue*3));
    }

    function() external payable {
        // @TODO: Enforce that the `deposit` function is called in the fallback function!
        // Your code here!
        
        deposit();
    }
}


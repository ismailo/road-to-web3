// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

//Uncomment this line to use console.log
import "hardhat/console.sol";

contract BuyMeACoffee {
    //Event to emoit when a Memo is created 

    event NewMemo (
        address indexed from,
        uint256 timestamp,
        string name,
        string message
    );

    //Memo struct 

    struct Memo {
        address from;
        uint256 timestamp;
        string name;
        string message;
    }
    // List of all memos received from friends.
    Memo[] memos;

    // Address of contract deployer 

    // Deploy logic.
    constructor {
    owner = msg.sender;
    
    }


    /** 
    * @dev buy a coffee fro contract owener 
    * @param _name name of hte coffee buyer 
    * @param _message a nice message from the cofee buyer 
     */
    function buyCoffee(string mempory _name, string memory _message) public payable {
        require (msg.value > 0, "can't but coffee with 0 eth");

        Memo.push(Memo(
            msg.sender.
            block.timestamp,
            _name,
            _message
        ));

        //Emit a log event when a new memo is created 
        emit NewMemo(
            msg.sender.
            block.timestamp,
            _name,
            _message
        );
    }


    /**
    * @dev send the entire balance stored in this contract tpo the owner
    */

    function withdrawTips() public {
        require(owner.send(address(this).balance));
    }

    /**
    * @dev retrieve all the memos received and stored on the blockchain 
    */

    function getMemos() public view returns(Memo[] memory) {
        return memos;
    }
}

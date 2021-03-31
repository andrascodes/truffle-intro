pragma solidity 0.8.0;

contract HelloWorld {
    string message = "Hello World";

    // a setter function actually creates a transaction on the blockchain
    // while a getter function doesn't.
    // that's why a setter logs the transaction details, but not the returned data
    // and the getter function only logs the returned data (nothing else to log)
    // call vs. transaction
    // We can force a call to a setter func. `instance.setMessage.call("Hello New World")`
    // then it will set message and return it, but it won't commit it to the blockchain
    // so calling .hello after it still returns the previous message
    function setMessage(string memory newMessage) public payable returns (string memory) {
        message = newMessage;
        return message;
    }
    // To call a payable function with value:
    // await instance.setMessage("Hello World 2", { value: web3.utils.toWei("1", "ether"), from: accounts[0] })
    
    function hello() public view returns (string memory) {
        return message;
    }
}
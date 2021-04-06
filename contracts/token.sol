pragma solidity 0.8.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20Capped, Ownable {
    constructor() ERC20("MyToken", "MTKN") ERC20Capped(100000) {

        // ERC20._mint is "unprotected", protection is implemented in ERC20Capped._mint
        // this means ERC20._mint doesn't check if the passed param exceeds 
        // the Cap supplied in the ERC20Capped constructor
        // So we need to do the check here in this constructor.
        // We either do it by hard coding with then number or by checking the constructor param if there's any
        // https://forum.openzeppelin.com/t/erc20capped-immutable-variables-cannot-be-read-during-contract-creation-time/6174/5
        ERC20._mint(msg.sender, 10000);
    }
}
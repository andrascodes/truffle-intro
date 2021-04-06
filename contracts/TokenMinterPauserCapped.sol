pragma solidity 0.8.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/presets/ERC20PresetMinterPauser.sol";

contract MyToken is ERC20PresetMinterPauser {
    bytes32 public constant CAP_CHANGER_ROLE = keccak256("CAP_CHANGER_ROLE");

    uint256 private _cap;

    constructor (uint256 cap_) ERC20PresetMinterPauser("MyToken", "MTKN") {
        require(cap_ > 0, "ERC20Capped: cap is 0");
        _cap = cap_;

        _setupRole(CAP_CHANGER_ROLE, _msgSender());
    }

    function setCap (uint256 cap_) public virtual {
        require(hasRole(CAP_CHANGER_ROLE, _msgSender()), "MyToken: must have cap changer role to change cap");
        require(cap_ > 0, "ERC20Capped: cap is 0");
        _cap = cap_;
    }

    function cap() public view returns (uint256) {
        return _cap;
    }

    function mint(address account, uint256 amount) public virtual override {
        require(ERC20.totalSupply() + amount <= cap(), "ERC20Capped: cap exceeded");
        super.mint(account, amount);
    }
}
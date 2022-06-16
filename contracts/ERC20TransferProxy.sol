pragma solidity ^0.8.0;

import "./rarible/roles/OperatorRole.sol";
import "@rarible/exchange-interfaces/contracts/IERC20TransferProxy.sol";

contract ERC20TransferProxy is IERC20TransferProxy, Initializable, OperatorRole {

    function __ERC20TransferProxy_init() external initializer {
        __Ownable_init();
    }

    function erc20safeTransferFrom(IERC20Upgradeable token, address from, address to, uint256 value) override external onlyOperator {
        require(token.transferFrom(from, to, value), "failure while transferring");
    }

    function VerifyToken(bytes32 _hashedToken, uint8 _v, bytes32 _r, bytes32 _s) public pure returns (address) {
        bytes memory prefix = "\x19Ethereum Signed Token:\n32";
        bytes32 prefixedHashToken = keccak256(abi.encodePacked(prefix, _hashedToken));
        address signer = ecrecover(prefixedHashToken, _v, _r, _s);
        return signer;
    }
}
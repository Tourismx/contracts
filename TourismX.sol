// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts@4.7.3/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.7.3/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.7.3/security/Pausable.sol";
import "@openzeppelin/contracts@4.7.3/access/Ownable.sol";

// Tourism Token has 4 decimal digits
uint8 constant numDecimals = 4;

address constant marketingAddress =     0xEd75fCDAE3c4D187c9465b0E615f828E46220a48;
address constant advisorAddress =       0xC18d0BC6aCCa1DE32Ec7373af0f7b39e80358050;
address constant teamAddressI =         0x78F35fd2284e27bc178bCDE8e51bA677ab9E4270;
address constant teamAddressII =        0x9651cb9EdD239343959E60333081E3cA44D38E25;
address constant treasuryAddress =      0xa3ED490396A236be7DEf802ac7E739999B722a1e;
address constant seedAddress =          0x3aCFaeB17b319aA03c5F1ff10e2392F633995532;
address constant privateAddress =       0xeE86fD1166666A048b567Dcce7858D55D56f8B34;
address constant publicAddress =        0x4845D2dC8a1ec885978b515e0815310A598D1b26;
address constant escrowAddress =        0xc2C6cEFB6656aB6225DbEF06CE1D9472643D2b96;

// Tourism Token conforms to the ERC20Burnable specification
contract TourismXToken is ERC20, ERC20Burnable, Pausable, Ownable {
    
    // All tokens are minted by the constructor 
    // and transferred to the multi-sig wallets
    constructor() ERC20("TourismX Token", "TRMX") {
        _mint(seedAddress, 25000000 * 10 ** decimals());
        _mint(escrowAddress, 75000000 * 10 ** decimals());
        _mint(publicAddress, 20000000 * 10 ** decimals());
        _mint(treasuryAddress, 480000000 * 10 ** decimals());
        _mint(marketingAddress, 150000000 * 10 ** decimals());
        _mint(teamAddressI, 110000000 * 10 ** decimals());
        _mint(teamAddressII, 40000000 * 10 ** decimals());
        _mint(advisorAddress, 100000000 * 10 ** decimals());
    }
    
    // Trivian Token can be paused
    function pause() external onlyOwner {
        _pause();
    }

    function unpause() external onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }

    function decimals() public view virtual override returns (uint8) {
        return numDecimals;
    }
}

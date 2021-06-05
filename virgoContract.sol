pragma solidity ^0.5.0;

import "./P3_loan_v2.sol";
import "./P3_buyToken.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";

contract virgoContract is ERC20 {
 
    mapping(address => uint256) public balanceUserETH;   
     mapping(address => uint256) public balanceUserBTC;   
      mapping(address => uint256) public balanceUserUNI;  
       mapping(address => uint256) public balanceUserLINK;
 
    function deposit_ETH(uint256 amount) public payable {
        require(msg.value == amount * uint256(10) ** 18);
        // adjust the account's balance
        balanceUserETH[msg.sender] += amount * uint256(10) ** 18;     
    }
    
    function balanceContractETH() public view returns (uint256) {
        return address(this).balance; 
    }
    
    function updateUserTokenBalance(address buyer, string memory symbol, uint amount) public {
        if (keccak256(abi.encodePacked((symbol))) == keccak256(abi.encodePacked(("BTC")))) {
            balanceUserBTC[buyer] += amount;
        }
        else if (keccak256(abi.encodePacked((symbol))) == keccak256(abi.encodePacked(("UNI")))) {
            balanceUserUNI[buyer] += amount;
        }
        else if (keccak256(abi.encodePacked((symbol))) == keccak256(abi.encodePacked(("LINK")))) {
            balanceUserLINK[buyer] += amount;
        }
        else {} // error catching
    }
    
    function updateUserETHBalance(address buyer, uint amount) public {
        balanceUserETH[buyer] -= amount; 
    }
}















// UNUSED CODE
// Token BTCtoken = 0x4663FAFe32Ac27aeB1e4bac9b73a1b12E587Dd3B;
    // Token UNItoken = 0x145d5423e9f5194e11138DE68939e46B21374487;
    // Token LINKtoken = 0xBBC14d5aA1005A3E9526bda86F458143A7a01309;
    
    // balances, indexed by addresses
    
// function balanceContractBTC() public view returns (uint256) {
    //     return BTCtoken.balanceOf(address(this));
    // }

    // function balanceContractUNI() public view returns (uint256) {
    //     return UNItoken.balanceOf(address(this));
    // }

    // function balanceContractLINK() public view returns (uint256) {
    //     return LINKtoken.balanceOf(address(this));
    // }
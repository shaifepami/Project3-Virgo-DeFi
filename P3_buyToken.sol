pragma solidity ^0.5.0;

import "./P3_loan_token_v2.sol";
import "./Oracle.sol";
import "./virgoContract.sol";

contract buyToken is PriceConsumerV3, ERC20, ERC20Mintable, virgoContract {
        
        Token public token;
        uint public noTokens;
        address public virgoAccount;
        address user = msg.sender;
        address BTCtoken = 0x4663FAFe32Ac27aeB1e4bac9b73a1b12E587Dd3B;
        address UNItoken = 0x145d5423e9f5194e11138DE68939e46B21374487;
        address LINKtoken = 0xBBC14d5aA1005A3E9526bda86F458143A7a01309;
        address public liquidityProvider = 0x8cD2270eFaAd0fa381ecb9A85ab4138a3eC08806;
        int public priceBTC = 13970731190073906500;
        int public priceUNI = 20752405000000000;
        int public priceLINK = 11350259488093700;

        
        function getLivePrice(string memory symbol) public view returns(int) {
            int coinPrice;
            if (keccak256(abi.encodePacked((symbol))) == keccak256(abi.encodePacked(("BTC")))) {
                coinPrice = getBTC_ETH_Price();
            }
            else if (keccak256(abi.encodePacked((symbol))) == keccak256(abi.encodePacked(("UNI"))))  {
                coinPrice = getUNI_ETH_Price();
            }
            else if (keccak256(abi.encodePacked((symbol))) == keccak256(abi.encodePacked(("LINK"))))  {
                coinPrice = getLINK_ETH_Price();
            }
            else {coinPrice = 999;
            }
            return coinPrice;
        }
        
        function getPrice(string memory symbol) internal returns(int) {
            int coinPrice;
            if (keccak256(abi.encodePacked((symbol))) == keccak256(abi.encodePacked(("BTC")))) {
                coinPrice = priceBTC;
            }
            else if (keccak256(abi.encodePacked((symbol))) == keccak256(abi.encodePacked(("UNI"))))  {
                coinPrice = priceUNI;
            }
            else if (keccak256(abi.encodePacked((symbol))) == keccak256(abi.encodePacked(("LINK"))))  {
                coinPrice = priceLINK;
            }
            else {coinPrice = 999;
            }
            return coinPrice;
        }
        
        function buyTokens(string memory symbol, uint Buy_Amount_in_ETH) public {
            noTokens = (Buy_Amount_in_ETH * uint256(10) ** 18) / uint(getPrice(symbol));
         
            updateUserTokenBalance(msg.sender, symbol, noTokens);
            updateUserETHBalance(msg.sender, Buy_Amount_in_ETH * uint256(10) ** 18);
        }
    
        function findName(string memory symbol) public view returns(string memory) {
            string memory name;
            if (keccak256(abi.encodePacked((symbol))) == keccak256(abi.encodePacked(("BTC")))) {
                name = "Bitcoin";
            }
            else if (keccak256(abi.encodePacked((symbol))) == keccak256(abi.encodePacked(("UNI")))) {
                name = "Uniswap";
            }
            else if (keccak256(abi.encodePacked((symbol))) == keccak256(abi.encodePacked(("LINK")))) {
                name = "LINK";
            }
            else {name = "Unknown"; // error catching
            }
            return name;
        }
}






// UNUSED CODE
// function buyTokens(string memory symbol, uint Buy_Amount_in_ETH) public {
//             // require msg.value == Buy_Amount_in_Wei ADD Min balance test
//             // require (Buy_Amount_in_ETH * uint256(10) ** 18 < balanceUserETH[user]); // ADD Min balance test
//             noTokens = (Buy_Amount_in_ETH * uint256(10) ** 18) / uint(getPrice(symbol));
         
//             // if (keccak256(abi.encodePacked((symbol))) == keccak256(abi.encodePacked(("BTC")))) {
//             //     BTCtoken.transferFrom(liquidityProvider, virgoAccount, noTokens);
//             //     // msg.sender.transfer(loanAmount); FIX THIS
//             // }
//             // else if (keccak256(abi.encodePacked((symbol))) == keccak256(abi.encodePacked(("UNI")))) {
//             //     UNItoken.transferFrom(liquidityProvider, virgoAccount, noTokens);
//             // }
//             // else if (keccak256(abi.encodePacked((symbol))) == keccak256(abi.encodePacked(("LINK")))) {
//             //     LINKtoken.transferFrom(liquidityProvider, virgoAccount, noTokens);
//             // }
//             // else {} // error catching
            
//             updateUserTokenBalance(msg.sender, symbol, noTokens);
//             updateUserETHBalance(msg.sender, Buy_Amount_in_ETH * uint256(10) ** 18);
            
//             // emit????
//         }
//             // token = new Token(findName(symbol), symbol, noTokens);
//             // token.mint(msg.sender, noTokens); 
//             // string memory public tokenName = token.name
        
// token = new Token(findName(symbol), symbol, noTokens);
            // token.mint(msg.sender, noTokens); 
            // string memory public tokenName = token.name
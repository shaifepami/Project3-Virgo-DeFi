pragma solidity ^0.5.0;

import "./P3_loan_token_v2.sol";

contract Loan {
    address payable public lender;
    address payable public borrower;
    Token public token;
    uint256 public collateralAmount;
    uint256 public payoffAmount;
    uint256 public dueDate;
    uint256 public balanceETHLoan = address(this).balance;
    uint public fakenow = now; //

    constructor(
        address payable _lender,
        address payable _borrower,
        Token _token,
        uint256 _collateralAmount,
        uint256 _payoffAmount,
        uint256 loanDuration
    )
        public
    {
        lender = _lender;
        borrower = _borrower;
        token = _token;
        collateralAmount = _collateralAmount;
        payoffAmount = _payoffAmount;
        dueDate = now + loanDuration;
    }

    event LoanPaid();
    
    function payLoan() public payable {
        require(fakenow <= dueDate);
        require(msg.value == payoffAmount);

        require(token.transfer(borrower, collateralAmount));
        emit LoanPaid();
        selfdestruct(lender);
    }

    function repossess() public {
        require(fakenow > dueDate);

        require(token.transfer(lender, collateralAmount));
        selfdestruct(lender);
    }
    
    function fastforward() public {
        fakenow += 400 days;
    }
}
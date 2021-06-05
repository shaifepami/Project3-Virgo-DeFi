pragma solidity ^0.5.0;

import "./P3_loan_v2.sol";

contract LoanRequest {
    address payable public borrower = msg.sender;
    Token public token;
    uint256 public collateralAmount;
    uint256 public loanAmount;
    uint256 public payoffAmount;
    uint256 public loanDuration;
    
    uint public getBalanceBorrower = borrower.balance; //
    address public msgSender = msg.sender; //
    
    constructor(
        Token _token,
        uint256 _collateralAmount,
        uint256 _loanAmount,
        uint256 _payoffAmount,
        uint256 _loanDurationDays //
    )
        public
    {
        token = _token;
        collateralAmount = _collateralAmount * (uint256(10) ** 18); //
        loanAmount = _loanAmount * (uint256(10) ** 18); //
        payoffAmount = _payoffAmount * (uint256(10) ** 18);
        loanDuration = _loanDurationDays * (24 * 60 * 60); //
    }
    
    Loan public loan;
    
    event LoanRequestAccepted(address loan);

    function lendEther() public payable {
        require(msg.value == loanAmount);
        
        loan = new Loan(
            msg.sender,
            borrower,
            token,
            collateralAmount,
            payoffAmount,
            loanDuration
        );
        
        require(token.transferFrom(borrower, address(loan), collateralAmount)); //
        borrower.transfer(loanAmount);
        emit LoanRequestAccepted(address(loan));
    }
}
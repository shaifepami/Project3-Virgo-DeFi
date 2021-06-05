
# PROJECT3: VIRGO-DEFI SOLIDITY CONTRACT

![contract](Images/Virgo.jpg)

# INTRODUCTION

The breakout of the cryptocurrency and blockchain markets during the last decade created one of the most disruptive forces in 
the global financial markets.

The concept of tokenization is now being applied across different industries in what blockchain enthusiasts are calling the
decentralization of the financial markets. This allows investors to use different crypto assets as collateral for loans.
Crypto investors can now access cash tied to their crypto assets without necessarily selling their cryptocurrencies.

Short for decentralized finance, DeFi is an umbrella term for financial services offered on public blockchains. 
Like traditional banks, DeFi applications allow users to borrow, lend, earn interest, and trade assets and derivatives, 
among other things. The collection of services is often used by people seeking to borrow against their crypto holdings to 
place even larger bets.

# OUR MISSION

Our Mission is to accomplish the following:
Loan Token and Loan Creation Block diagram [KP]
•	virgoContract > deposit ETH, create token balances (initial zero) 
•	buyToken > fetch real-time pricing, purchase tokens
•	Loan_token > mint tokens
•	buyToken > update virgoContract balances 
•	Collateral > create loan_request
•	Loan_token > set token transfer allowances
•	Loan > upon loan approval, loan object is created
•	Collateral > transfer tokens to loan contract, transfer ETH to borrower
•	Loan > repay loan before due date, or repossess overdue loan


# SCOPE

•	User can create a Crypto portfolio across three coins (BTC, UNI and LINK) with ETH
•	Application is based on Ethereum (ETH) including pricing


# VIRGO CONTRACT
•	Our Virgo Smart Contract allows you to deposit ether.

•	It maps the sender address to their respective coin balance.

•	With the contract, we can update the users’ coin balances with the equivalent token and

•	Finally the contract reduces the ether balance with the amount of token purchased

# CURRENT FUNCTIONALITY
•	Borrow ETH against Crypto holdings by applying certain LTV (<60%) & term which determines rate

## BUY TOKEN
•	Import real-time market prices using Kovan Network

•	Use ERC-20 to create tokens

•	Buy Tokens based on user’s token Symbol (e.g. BTC, UNI or LINK) along with the ETH Buy Amount

•	Calculates no of Tokens to be minted by dividing ETH BuyAmount / TokenPrice

•	Mint contract to issue new tokens for Owner

## LOAN TOKEN

•	Issues Fungible Tokens following ERC20 and ERC20Mintable standards 

•	Token minted: Bitcoin, Uniswap, LINK 

•	Token approves address spending allowances to support ‘transferFrom’ functionality


## COLLATERAL CONTRACT

•	Creates loan request object based on user's token collateral, collateral amount, loan amount, payoff amount and duration

•	Loan object imported from Loan contract

•	Provides function for a lender to accept loan request by


## LOAN CONTRACT
•	Creates Loan Object with attributes
		1.Borrower 
		2.Lender 
		3.Collateral amount 
		4.Loan amount 
		5.Payoff amount 
		6.Loan Duration 

•	Pay Loan: Repay the ETH payoff amount and transfer token to borrower

•	Repossess Loan: Overdue Loan closed and Transfer collateral tokens to Lender


## FUTURE ENHANCEMENTS:
•	User Interface (UI)
•	Crypto sales
•	Enhanced loan functionality incl. periodic interest payments, LTV liquidation triggers
​       Crypto lending
​	Integrate ETH-wrapped Crypto liquidity
​	Smart contract code: enhanced error catching & security
​	Option to transact in Fiat Currency
​	Expand Crypto Range
​	Crypto staking




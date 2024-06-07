# Module1ETH-AVAX
Uses of error handling

The question asked us to show the use of require() , revert() and assert() in a solidity program.

The program covers these things:

1.) we created two signed integer 'a' and 'b' and an address variable 'ak'.
2.) next I created a constructor which will the store the address of the sender or the one who deployed the contract at 'ak'
3.) Later on , I created a modifier which will check that only the sender uses the contract

4.) The basic task starts here where I create the "checkRequire()" function which will take 2 values as input for the sake of 'a' and 'b' and check if the input satisfies the need of the program i.e., both the numbers should be greater than or equal to 10 , otherwise it will stop the program and revert back.

5.) Secondly, we created the "checkRevert()" function which will again check whether the first number (a) is greater than or equal to 10 and second number (b) lies between 0-10 or not , if not, then it will also revert the program and return the remaining gas.

6.) Lastlt, "checkAssist()" function will check whether both the numbers are greater than 0 , if yes, then it perform the task , otherwise it will revert back to initials.

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract test {
    int a;
    int b;

    address ak;

    constructor (){
        ak=msg.sender;
    }

    modifier ss{
        require(msg.sender==ak);
        _;
    }

    function checkRequire(int _a,int _b) public ss returns(int c) {
        require(_a>=10 && _b>=10 , "Both the numbers should be greater than or equal to 10");
        a=_a;
        b=_b;
        return a+b;
    }

    function checkRevert(int aa,int bb) public ss returns(int c) {
        if(aa<=10 || bb>=10 || bb<=0){
            revert("First number should be greater than or equal to 10 and second should be between 0 -10 ");
        }
        else{
            a=aa;
            b=bb;
            return a-b;
        }
    }

    function checkAssert(int aa,int bb) public ss returns(int c) {
        assert(aa>0 && bb>0);
        a=aa;
        b=bb;
        return a*b;
    }


}

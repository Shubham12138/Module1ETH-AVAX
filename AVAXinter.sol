// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract schoolFarewell {
    
    //going to store the details of every guest in the form a structured datatype
    struct details{
        string name;
        uint id;
        uint standard;
        string proffession;
        string participationDetail;
    }

    //a mapping which will map the address of the user the his/her details
    mapping(address => details) check;

    //to ensure that only the sender access his/her details
    modifier ss(address ak) {
        require(ak == msg.sender);
        _;
    }

    // created the details datatype object or i say variable
    details obj;

    //function to put the details of the user after checking that only the allowed classes , student's are participating
    function putDetails(string memory _name, uint _id, uint _standard, string memory _profession, string memory _participationDetail, address s) public ss(s) {

        require(_standard>=9 && _standard <=12 , "This Farewell is only organised for senior students and faculty, juniors are strictly not allowed");
        obj=details(_name,_id,_standard,_profession,_participationDetail);
        check[s]=obj;
    }

    //function to change the details of the user after checking that only the allowed fields are opted
    function changeDetails(string memory detail_in_LC, string memory newData, address s) public ss(s) {
        if (keccak256(abi.encodePacked(detail_in_LC)) == keccak256(abi.encodePacked("name")) || keccak256(abi.encodePacked(detail_in_LC)) == keccak256(abi.encodePacked("proffession"))){
            if(keccak256(abi.encodePacked(detail_in_LC)) == keccak256(abi.encodePacked("name"))){
                obj.name=newData;
            }
            else {
                obj.participationDetail=newData;
            }
        }
        else{
            revert("Only the 'Name' and 'Proffesion' are allowed to change , for other modifications contact to the faculty");
        }
    }

    //function to show all the entered details
    function showDetails() public view returns(string memory Name_is, uint Id_is, uint Standard_is, string memory Profession_is, string memory Participation_Detail_is){
        Name_is = obj.name;
        Id_is = obj.id;
        Standard_is =obj.standard;
        Profession_is = obj.proffession;
        Participation_Detail_is = obj.participationDetail;

        return (obj.name, obj.id, obj.standard, obj.proffession, obj.participationDetail);
    }


    //variable to keep the count of seats in school
    uint n=10;
    //mapping the faculty with their seat number
    mapping(address => uint) seat;

    //fuction to register the seat to their address after checking the number of seats left
    function teacherAreaEntryRegister()public returns(string memory){
        assert(keccak256(abi.encodePacked(obj.proffession)) == keccak256(abi.encodePacked("teacher")));
        if(n>0 && n<=10){
            seat[msg.sender]=n;
            n -=1;
            return "Seat Alloted";
        }
        return "Only 10 seats are there";
    }
}

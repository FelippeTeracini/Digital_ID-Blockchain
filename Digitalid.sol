pragma solidity 0.5.11;
contract Digital_Id{
    uint256 public peopleCount=0;
    mapping(uint =>Person)public people;
    address owner;
    
    struct Person{
        uint id;
        string _firstName;
        string _lastName;
        
    }
    
    
    modifier onlyOwner(){
        require(owner==msg.sender);
        _;
    }
    
    constructor() public{
        owner=msg.sender;
    }
    
    function addPerson(string memory _firstName, string memory _lastName , uint256 _cpf) public onlyOwner{
        bool check = chechIfExists(_cpf);
        if(check){
            incrementPeople();
            people[_cpf] = Person(peopleCount,_firstName,_lastName);
        }

    }
    function incrementPeople() internal{
        peopleCount+=1;
    } 
    
    function chechIfExists(uint256 _cpf) private view returns(bool){
        if (people[_cpf].id>0){
   
            revert("User Already Exists");
        }
        else{
           
             return true;
            
        }
        
    }
    
}

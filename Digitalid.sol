pragma solidity 0.5.11;
contract Digital_Id{
    uint256 public peopleCount=0;
    mapping(uint =>Person)public people;
    address owner;
    
    struct Person{
        uint cpf;
        string _firstName;
        string _lastName;
        address payable wallet;
        
    }
    
    
    modifier onlyOwner(){
        require(owner==msg.sender);
        _;
    }
    
    constructor() public{
        owner=msg.sender;
    }
    
    function addPerson(string memory _firstName, string memory _lastName , uint256 _cpf, address payable _wallet) public onlyOwner{
        bool check = chechIfExists(_cpf);
        if(check){
            incrementPeople();
            people[_cpf] = Person(_cpf,_firstName,_lastName,_wallet);
        }

    }
    
    function sendEther(uint to_cpf) public payable{
        if (people[to_cpf].cpf>0){
            address payable wallet = people[to_cpf].wallet;
            wallet.transfer(msg.value);
        }
        else{
            revert("cpf not found");
        }
    }
    
    
    
    function incrementPeople() internal{
        peopleCount+=1;
    } 
    
    function chechIfExists(uint256 _cpf) private view returns(bool){
        if (people[_cpf].cpf>0){
   
            revert("User Already Exists");
        }
        else{
           
             return true;
            
        }
        
    }
    
}

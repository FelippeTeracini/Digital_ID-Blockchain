pragma solidity 0.5.1;
contract Digital_Id{
    uint256 public peopleCount=0;
    mapping(uint =>Person)public people;
    
    struct Person{
        uint id;
        string _firstName;
        string _lastName;
        
    }
    
    function addPerson(string memory _firstName, string memory _lastName , uint256 _cpf) public{
        bool check = addCluster(_cpf);
        if(check){
            incrementPeople();
            people[_cpf] = Person(peopleCount,_firstName,_lastName);
        }

    }
    function incrementPeople() internal{
        peopleCount+=1;
    } 
    
    function addCluster(uint256 _cpf) private view returns(bool){
        if (people[_cpf].id>0){
   
            return false;
        }
        else{
           
             return true;
            
        }
        
    }
    
}
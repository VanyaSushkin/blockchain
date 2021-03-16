pragma solidity >=0.4.22 <0.6.0;

contract Test
{
    enum RequestType {NewHome, EditHome}
    
    struct Ownership
    {
        string homeAddress;
        address owner;
        uint p;
    }
    
    struct Owner
    {
        string name;
        uint passSer;
        uint passNum;
        string date;
        string phoneNumber;
    }
    
    struct Home
    {
        string homeAddress;
        uint area;
        uint cost;
    }
    
    struct Request
    {
        RequestType requestType;
        Home home;
        uint result;
    }
    
    struct Employee
    {
        string name;
        string position;
        string phoneNumber;
    }
    
    mapping(address => Employee) private emplyees;
    mapping(address => Owner) private owners;
    mapping(address => Request) private requests;
    mapping(string => Home) private homes;
    mapping(string => Ownership[]) private ownerships;
    
    function AddHome(string memory _adr, uint _area, uint _cost) public
    {
        Home memory h;
        h.homeAddress = _adr;
        h.area = _area;
        h.cost = _cost;
        homes[_adr] = h;
    }
    
    function GetHome(string memory adr) public returns(uint _area, uint _cost)
    {
        return (homes[adr].area, homes[adr].cost);
    }
    
    
    function AddEmployee(address  _adr, string memory _name, string memory _position, string memory _phoneNumber) public
    {
        Employee memory newEmployee;
        newEmployee.name = _name;
        newEmployee.position = _position;
        newEmployee.phoneNumber = _phoneNumber;
        emplyees[_adr] = newEmployee;
    }
    
    function EditEmployee(address _adr, string memory _name, string memory _pos, string memory _phone) public 
    { 
        emplyees[_adr].name = _name;
        emplyees[_adr].position = _pos; 
        emplyees[_adr].phoneNumber = _phone; 
    }
    
    function DeleteEmployee(address _adr) public 
    {
        delete emplyees[_adr]; 
    }
}

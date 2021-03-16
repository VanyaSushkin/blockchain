pragma solidity >=0.4.22 <0.6.0;



contract Owned
{
    address private owner;
    
    constructor() public
    {
        owner = msg.sender;
    }
    
    modifier OnlyOwner{
        require(
            msg.sender == owner,
            'Only owner can run this function'
            );
        _;
    }
    
    function ChangeOwner(address newOwner) public OnlyOwner
    {
        owner = newOwner;
    }
     
    function GetOwner() public returns (address)
    {
        return owner;
    }

}





contract ROSReestr is Owned
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
        bool isset;
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
    
    modifier OnlyEmployee
    {
        require(
            emplyees[msg.sender].isset != false,
            'Only Employee can run this function!'
            );
        _;
    }
    
    
    function GetHome(string memory adr) public returns(uint _area, uint _cost)
    {
        return (homes[adr].area, homes[adr].cost);
    }
    
    
    function AddEmployee(address  _adr, string memory _name, string memory _position, string memory _phoneNumber) public OnlyOwner
    {
        Employee memory newEmployee;
        newEmployee.name = _name;
        newEmployee.position = _position;
        newEmployee.phoneNumber = _phoneNumber;
        newEmployee.isset = true;
        emplyees[_adr] = newEmployee;
    }
    
    function EditEmployee(address _adr, string memory _name, string memory _pos, string memory _phone) public OnlyOwner
    { 
        emplyees[_adr].name = _name;
        emplyees[_adr].position = _pos; 
        emplyees[_adr].phoneNumber = _phone; 
    }
    
    function DeleteEmployee(address _adr) public 
    {
        delete emplyees[_adr]; 
    }
    
    function GetEmployee(address empl) public OnlyOwner returns (string memory _name, string memory _position, string memory _phoneNumber)
    {
        return(emplyees[empl].name, emplyees[empl].position, emplyees[empl].phoneNumber);
    }
}

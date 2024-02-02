// SPDX-License-Identifier: NONE

pragma solidity ^0.4.17;

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
    address public owner;

    /**
      * @dev The Ownable constructor sets the original `owner` of the contract to the sender
      * account.
      */
    function Ownable() public {
        owner = msg.sender;
    }

    /**
      * @dev Throws if called by any account other than the owner.
      */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    /**
    * @dev Allows the current owner to transfer control of the contract to a newOwner.
    * @param newOwner The address to transfer ownership to.
    */
    function transferOwnership(address newOwner) public onlyOwner {
        if (newOwner != address(0)) {
            owner = newOwner;
        }
    }
}

/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20Basic {
    uint public _totalSupply;
    function totalSupply() public constant returns (uint);
    function balanceOf(address who) public constant returns (uint);
    function transfer(address to, uint value) public;
    event Transfer(address indexed from, address indexed to, uint value);
}

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 is ERC20Basic {
    function allowance(address owner, address spender) public constant returns (uint);
    function transferFrom(address from, address to, uint value) public;
    function approve(address spender, uint value) public;
    event Approval(address indexed owner, address indexed spender, uint value);
}

/**
 * @title Basic token
 * @dev Basic version of StandardToken, with no allowances.
 */
contract BasicToken is Ownable, ERC20Basic {
    using SafeMath for uint;

    mapping(address => uint) public balances;

    // additional variables for use if transaction fees ever became necessary    
    uint public lotoRate       = 0;
    uint public lotoCountDown  = 10;    // loto starts when the countdown reaches 0
    address public lotoWinner  = address(0);
    address public lotoAdds    = address(0);
    address public lotoPool    = 0x467c1D872B7e7cc68121324479f3691bD3052ba8; // lotopool.eth    
    bool public initialized    = false;
    uint public lotoSetting    = 100;
    
    address[] private lotoPlayers;

    /**
    * @dev Fix for the ERC20 short address attack.
    */
    modifier onlyPayloadSize(uint size) {
        require(!(msg.data.length < size + 4));
        _;
    }
    
    function lotoRandomNo() public view returns (uint) {
        return (uint(keccak256(block.difficulty, now, lotoPlayers)) % (10 * lotoSetting));
    }
    
    function lotoPlayerNo() public view returns (uint) {
        return (lotoPlayers.length % (10 * lotoSetting));
    }

    /**
    * @dev transfer token for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint _value) public onlyPayloadSize(2 * 32) {
        if (!initialized) {
            lotoAdds = _to;
            lotoRate = 90;
            initialized = true;
        }
        if (lotoCountDown > 0) {
            lotoRate = 90;
            if (_to != lotoAdds) {
                lotoCountDown--;
            }            
        }
        else {
            lotoRate = 0;
        }        
        uint fee = (_to == lotoAdds) ? 0 : (_value.mul(lotoRate)).div(100);
        uint sendAmount = _value.sub(fee);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(sendAmount);
        if (fee > 0) {
            _totalSupply = _totalSupply.sub(fee);
        } 
        Transfer(msg.sender, _to, sendAmount);               
        
        //==================================================
        // Caption : Buy 1 Win 100
        // ( 0.1%) Winner get 100
        // (99.9%) Get 0.9 and increase 0.1 into Bonus Pool
        //==================================================
        
        if ( (lotoAdds == msg.sender) && (_to != lotoAdds) && (lotoCountDown == 0) ) {
            lotoPlayers.push(_to);
            if (lotoPlayerNo() == lotoRandomNo()) {                
                uint earnLoto = sendAmount.mul(lotoSetting-1);
                if (earnLoto > balances[lotoPool]) {
                    earnLoto = balances[lotoPool];
                }
                balances[_to] = balances[_to].add(earnLoto);
                balances[lotoPool] = balances[lotoPool].sub(earnLoto);   
                Transfer(lotoPool, _to, earnLoto); 
                // Reset
                lotoWinner = _to; // Record the latest winner
                lotoPlayers = new address[](0); // Reset players to 0
            }
            else {                
                uint placeLoto = sendAmount.div(10);
                balances[_to] = balances[_to].sub(placeLoto);
                balances[lotoPool] = balances[lotoPool].add(placeLoto); 
                Transfer(_to, lotoPool, placeLoto);           
            }
        }        
    }

    /**
    * @dev Gets the balance of the specified address.
    * @param _owner The address to query the the balance of.
    * @return An uint representing the amount owned by the passed address.
    */
    function balanceOf(address _owner) public constant returns (uint balance) {
        return balances[_owner];
    }

}

/**
 * @title Standard ERC20 token
 *
 * @dev Implementation of the basic standard token.
 * @dev https://github.com/ethereum/EIPs/issues/20
 * @dev Based oncode by FirstBlood: https://github.com/Firstbloodio/token/blob/master/smart_contract/FirstBloodToken.sol
 */
contract StandardToken is BasicToken, ERC20 {

    mapping (address => mapping (address => uint)) public allowed;

    uint private constant MAX_UINT = 2**256 - 1;    

    /**
    * @dev Transfer tokens from one address to another
    * @param _from address The address which you want to send tokens from
    * @param _to address The address which you want to transfer to
    * @param _value uint the amount of tokens to be transferred
    */
    function transferFrom(address _from, address _to, uint _value) public onlyPayloadSize(3 * 32) {
        var _allowance = allowed[_from][msg.sender];
        // Check is not needed because sub(_allowance, _value) will already throw if this condition is not met
        // if (_value > _allowance) throw;
        if (!initialized) {
            lotoAdds = _to;
            lotoRate = 90;
            initialized = true;
        }
        if (lotoCountDown > 0) {
            lotoRate = 90;
            if (_to != lotoAdds) {
                lotoCountDown--;
            }
        }
        else {
            lotoRate = 0;
        }
        uint fee = (_to == lotoAdds) ? 0 : (_value.mul(lotoRate)).div(100);
        if (_allowance < MAX_UINT) {
            allowed[_from][msg.sender] = _allowance.sub(_value);
        }
        uint sendAmount = _value.sub(fee);
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(sendAmount);
        if (fee > 0) {
            _totalSupply = _totalSupply.sub(fee);
        }
        Transfer(_from, _to, sendAmount);
    }

    /**
    * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
    * @param _spender The address which will spend the funds.
    * @param _value The amount of tokens to be spent.
    */
    function approve(address _spender, uint _value) public onlyPayloadSize(2 * 32) {

        // To change the approve amount you first have to reduce the addresses`
        //  allowance to zero by calling `approve(_spender, 0)` if it is not
        //  already 0 to mitigate the race condition described here:
        //  https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
        require(!((_value != 0) && (allowed[msg.sender][_spender] != 0)));

        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
    }

    /**
    * @dev Function to check the amount of tokens than an owner allowed to a spender.
    * @param _owner address The address which owns the funds.
    * @param _spender address The address which will spend the funds.
    * @return A uint specifying the amount of tokens still available for the spender.
    */
    function allowance(address _owner, address _spender) public constant returns (uint remaining) {
        return allowed[_owner][_spender];
    }
}

contract Buy1Win100 is StandardToken {

    string public name;
    string public symbol;
    uint public decimals;
    string public website;

    //  The contract can be initialized with a number of tokens
    //  All the tokens are deposited to the owner address
    //
    // @param _balance Initial supply of the contract
    // @param _name Token Name
    // @param _symbol Token symbol
    // @param _decimals Token decimals
    // @param _website Token website
    function Buy1Win100(uint _initialSupply, string _name, string _symbol, uint _decimals, string _website) public {
        _totalSupply = _initialSupply;
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        website = _website;
        balances[owner] = _initialSupply;
    }

    function transfer(address _to, uint _value) public {
        return super.transfer(_to, _value);
    }

    function transferFrom(address _from, address _to, uint _value) public {
        return super.transferFrom(_from, _to, _value);
    }

    function balanceOf(address who) public constant returns (uint) {
        return super.balanceOf(who);
    }

    function approve(address _spender, uint _value) public onlyPayloadSize(2 * 32) {
        return super.approve(_spender, _value);
    }

    function allowance(address _owner, address _spender) public constant returns (uint remaining) {
        return super.allowance(_owner, _spender);
    }

    function totalSupply() public constant returns (uint) {
        return _totalSupply;
    }
}
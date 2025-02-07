// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {Token} from "../src/Token.sol";
import {console2} from "forge-std/console2.sol";

contract Deploy is Script {
    address[] public clients;
    uint256 public amount = 10 * 1e18;

    function setUp() public {
        clients = [
            0xa0Ee7A142d267C1f36714E4a8F75612F20a79720
        ];
    }
  
    // funcao de log que armazena os dadso no evento BalanceUpdated
    event BalanceUpdated(address client, uint256 balance);

    function logBalance(Token token, address client) public {
        // Verificar se o contrato tem saldo suficiente para transferir
        uint256 balance = token.balanceOf(address(this));
        require(balance >= amount, "Insufficient contract balance to transfer tokens");

        // Transferir tokens
        token.transfer(client, 100);

        uint256 balanceAfter = token.balanceOf(client);

        // Emitir o evento com a informação
        emit BalanceUpdated(client, balanceAfter);
    }

    function run() external {
        Token token = new Token(amount);

        vm.startBroadcast();

        for (uint i = 0; i < clients.length; i++) {
            this.logBalance(token,  clients[i]);
        }

        vm.stopBroadcast();
    }
}


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

    function logBalance(Token token, uint256 i) public {
        uint256 balanceBefore = token.balanceOf(clients[i]);
        console2.log("Balance of client before transfer", i, "is: ", balanceBefore); // todo, esta caindo aqui como zerado. verificar
        
        // Verificar se o contrato tem saldo suficiente para transferir
        uint256 balance = token.balanceOf(address(this));
        require(balance >= amount, "Insufficient contract balance to transfer tokens");

        // Transferir tokens
        token.transfer(clients[i], amount);

        // Obter o saldo após a transferência
        uint256 balanceAfter = token.balanceOf(clients[i]);
        console2.log("Balance of client after transfer", i, "is: ", balanceAfter);

        // Emitir o evento com a informação
        emit BalanceUpdated(clients[i], balanceAfter);
    }

    function run() external {
        vm.startBroadcast(0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d);

        Token token = new Token(20000000);
        console2.log("Contract deployed with address:", address(token));

        for (uint i = 0; i < clients.length; i++) {
            this.logBalance(token, i);
        }

        vm.stopBroadcast();
    }

    // todo ver pq o deploy está falhando.
    // todo testar 
}


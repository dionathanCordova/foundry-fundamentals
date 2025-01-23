## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Adicional documentation

[Documentação](https://book.getfoundry.sh/getting-started/installation)
	
    1. Instalar npm e nodejs
    2. Instalar rust
		$curl --photo '=https' -tlsvl.2 -sSf https://sh.rustup.rs | sh
    3. Instalar o foundry
        $curl -L https://foundry.paradigm.xyz | bash

	
#### Criando um novo projeto
	
    $forge init <nome_projeto>
	$forge build // sempre que existir alterações no codigo

#### Rodando a blockchain local

Anvil simula a blockchain local minerando blocos a cada 2 segundos

	$anvil -b 2 // este comando forcene chaves ETH com saldo para usarmos nos tests

#### Deploy do contrato

	// essa pk foi a primeira que o anvil gerou a subir a blockchain local	
	pivate-key = 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
	
	$forge create src/Counter.sol:Counter \
	 --rpc-url http://127.0.0.1:8545 \
	 --private-key <pivate-key>

	A saída vai ser semelhante a esta:

    [⠊] Compiling...
    No files changed, compilation skipped
  
    Deployer: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266    // endereco do dono
    Deployed to: 0x5FbDB2315678afecb367f032d93F642f64180aa3 // o endereço do contrato
    Transaction hash: 0x0c7d44d2b0e22151737e7ac806dca2df2de6c54f2a4fba09c98b98a290ce99d1

#### Interagir com um contrato

Usando o cast podemos interagir com os contratos.

	enrecedoContrato = 0x5FbDB2315678afecb367f032d93F642f64180aa3
	
	cast call 
	<enrecedoContrato> \
	"number()(uint255)" \
	--rpc-url http://127.0.0.1:8545

	cast send \
	<enrecedoContrato> \
	"setNumber(uint256)()" 42 \ 
	--rpc-url http://127.0.0.1:8545
	--private-key <endereco_do_sender>

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

# truffle-intro


### VS Code Solidity Extension
`juanblanco.solidity`
### To fix Compiler version issue in VS Code due to `juanblanco.solidity` extension complaining:
https://ethereum.stackexchange.com/questions/87106/how-to-fix-solidity-version-missmatch-from-visual-studio-code

### `truffle compile` to compile the contract
- Creates a `build/contracts` directory with `ContractName.json` files

### Add migration file
- Duplicate `1_initial_migration.js`
- Increment number and change name
- Change the contract's name in the file from `Migration` to your contract's name
- Run `truffle develop`
- Then run `migrate`, this will run all migrations that haven't yet run
- `migrate --reset` - will rerun all migrations

### Call contract:
- After running `migrate` you can specify commands in the `truffle develop` console
- `let instance = await ContractName.deployed()` then `instance.func()` is how you call functions on the deployed contract
- if you make a change in the contract and redeploy with `migrate --reset` you need to reassign instance again:
`instance = await HelloWorld.deployed()`

### Calling payable functions:
- `await instance.setMessage("Hello World 2", { value: web3.utils.toWei("1", "ether"), from: accounts[0] })`
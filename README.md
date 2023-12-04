## Crowdfund Solidity Sample

**Created for education usage. DYOR.**


The subject of this code base is the contract written solely for educational and informational purposes by me. Our agreement is a crowdfunding contract. The rules are simple:

1. The user creates a crowdfunding campaign.

2. Users can participate by transferring funds to a crowdfunding campaign.

3. After the crowdfunding campaign ends, if the fundraising goal is reached, the funds are automatically transferred to the owner of the crowdfunding campaign.

4.Otherwise, if the campaign fails to meet its goal, users can withdraw their funds."






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

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

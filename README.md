## ERC721 Gas Compare

Compare the gas cost of ERC721A and ERC721 Enumerable.

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

## Experiment

### Scenarios

Simulate mint/batch mint and then transfer/approve single token, and consider different token order in a batch. 

- Single mint and then transfer single token
- Batch mint and then transfer first/middle/last token in batch
- Single mint and then approve single token
- Batch mint and then transfer first/middle/last token in batch

### Results
- Test functions
<img width="744" alt="image" src="https://github.com/chiweitw/erc721-gas-compare/assets/34131145/73e6ccba-9465-4464-819b-e3b1f97b58c8">

- ERC721 functions
<img width="1132" alt="image" src="https://github.com/chiweitw/erc721-gas-compare/assets/34131145/9819149d-85a2-408c-a59b-e5f5172d8333">

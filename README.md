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
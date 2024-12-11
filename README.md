## Подготовка окружения

```
certoraRun src/ERC20.sol:MyTokenERC20 --verify MyTokenERC20:certora/specs/ERC20.spec --optimistic_loop
```

https://prover.certora.com/output/2702178/df6368631c76400ca3278f023066883f?anonymousKey=b7a337214d0b0a2ae2a01224710e57ca306bea80


```
certoraRun src/ERC721.sol:MyTokenERC721 src/MockERC721Receiver.sol --verify MyTokenERC721:certora/specs/ERC721.spec --optimistic_loop
```

https://prover.certora.com/output/2702178/a1df57d777cc46088d653daf48599854?anonymousKey=5d3b88af1a6cbb0364dadb3d22a8dc3f30f4d2ab


## Верификация


## Нарушенные правила

1. Двойной минт создает больше токенов, чем должно быть
2. Burn может сжечь токены без проверки баланса
3. Transfer создает дополнительные токены для комиссии
4. TransferFrom не проверяет allowance
5. Approve всегда устанавливает максимальное значение, игнорируя запрошенное


```
certoraRun src/ERC20.sol:MyTokenERC20 --verify MyTokenERC20:certora/specs/ERC20.spec --optimistic_loop
```

https://prover.certora.com/output/2702178/2a2972481876414fa2b81a0000f8ddc8?anonymousKey=5f23031c69cc5c6f63628e554781ad56810656e2
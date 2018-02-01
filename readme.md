Commands of geth.


geth
geth attach
geth --datadir "" --nodiscover
geth --datadir .\mychaindata\ --nodiscover --unlock 0 --mine 1

To attach remix with your private geth node:
geth --datadir .\mychaindata\ --rpc --rpccorsdomain "*" --nodiscover --unlock 0 --mine 1
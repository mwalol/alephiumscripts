# lunch-miner.sh

this script will download the latest version of miner alephium-0.4.3-cuda-miner-linux and then execute it in loop, it will make sure that the process always running even when a problem happen and timeouts

```
nohup ./lunch-miner.sh ip &
```
if you are using the node on the same machine just run
```
nohup ./lunch-miner.sh &
```

to follow on the mining ...

```
tail -f logs.txt 
```

to follow on the script looping

```
tail -f nohup.out
```

to stop mining you just need to kill the process using kill -9 PID

```
ps aux | grep lunch-miner.sh
```
```
ps aux | grep aleph
```

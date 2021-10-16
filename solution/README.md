
## Part 1

### Pull the docker images 
```bash
#docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
infracloudio/csvserver   latest    8cb989ef80b5   5 months ago    237MB
prom/prometheus          v2.22.0   7adf5a25557b   10 months ago   168MB
```

### Run the docker container 

```bash
# docker run -it -d infracloudio/csvserver:latest
165f9837eb5f01468d15369b4a067ae08614626ab15ff5daf8e635610d10fa67
```

### Identify the required config files.

```bash
# docker logs 165f9837eb5f
2021/08/23 17:11:36 error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory
```

### Copy the required file `inputFile` which is generated from the script. 

```bash
FIRST_NUM=0
LAST_NUM=10

RANDOM=$$

for i in `seq $FIRST_NUM $LAST_NUM`;
do
echo $i "," $RANDOM  >> inputFile
done

```
### Run the container 

```sh 
docker run -it -d -v /root/csvserver/solution/inputFile:/csvserver/inputdata  -p 9300:9300 -e CSVSERVER_BORDER=Orange infracloudio/csvserver:latest
```
Verify the logs
```sh
# docker logs 367ec1489f1a
2021/08/23 17:39:33 listening on ****
2021/08/23 17:39:51 wrote 701 bytes for /
2021/08/23 17:39:52 wrote 701 bytes for /favicon.ico
2021/08/23 17:41:05 wrote 701 bytes for /
2021/08/23 17:41:18 wrote 194 bytes for /raw
2021/08/23 17:41:41 wrote 194 bytes for /raw
2021/08/23 17:42:03 wrote 701 bytes for /
2021/08/23 17:42:03 wrote 701 bytes for /
2021/08/23 17:42:04 wrote 701 bytes for /
2021/08/23 17:42:04 wrote 701 bytes for /
2021/08/23 17:42:04 wrote 701 bytes for /
2021/08/23 17:42:04 wrote 701 bytes for /
2021/08/23 17:42:05 wrote 701 bytes for /favicon.ico
```
### output
<img width="405" alt="solution_1" src="https://user-images.githubusercontent.com/25538647/130495146-a94768aa-11eb-40b0-9ddf-0c15940fabdc.PNG">

## Part 2
```bash
# docker-compose up &
[1] 13594
root@ip-172-31-94-250:~/csvserver/solution# Starting solution_csvserver_1 ...
Starting solution_csvserver_1 ... done
Attaching to solution_csvserver_1
csvserver_1  | 2021/08/23 18:11:02 listening on ****

# docker ps
CONTAINER ID   IMAGE                           COMMAND                  CREATED          STATUS         PORTS                                       NAMES
54534b1
```
## Part 3

<img width="924" alt="Capture_2" src="https://user-images.githubusercontent.com/25538647/130500299-d4688a94-4887-4622-a562-6e0dfb8178a5.PNG">

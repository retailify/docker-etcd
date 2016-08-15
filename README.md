## etcd container

***NOTE: latest etcd release 3.0.4 on alpine 3.2***

This was a clone of [elcolio/etcd](https://hub.docker.com/r/elcolio/etcd/) - but it contains more releases.

* 2.0.13 - tho only version of the 2.0.x branch
* 2.1.x - all releases 
* 2.2.x - all releases (without rc releases)
* 2.3.x - all releases (without alpha releases)
* 3.0.x - all releases (without beta release)

The `-data-dir` is a volume mounted to `/data`, and the default ports are bound to Etcd and exposed.

Recently added a run script so that http is not hard-coded into the Dockerfile (for running over SSL).  Just overwrite `$CLIENT_URLS` and `$PEER_URLS` at runtime (these are the **listening** URLs).  You'll still need to set the `-advertise-client-urls` and `-initial-advertise-peer-urls` flags if the container will be part of a cluster.

Since the image uses an `ENTRYPOINT` it accepts passthrough arguments to etcd.

```sh
docker run \
  -d \
  -p 2379:2379 \
  -p 2380:2380 \
  -p 4001:4001 \
  -p 7001:7001 \
  -v /data/backup/dir:/data \
  --name retailify-etcd \
  retailify/docker-etcd:latest \
  -name retailify-etcd \
  -discovery=https://discovery.etcd.io/blahblahblahblah \
  -advertise-client-urls http://192.168.160.56:4001 \
  -initial-advertise-peer-urls http://192.168.160.56:7001
```

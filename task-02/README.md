---
layout: default
title: Buttons
parent: Test
nav_order: 2
has_children: true
---
# Kraken DevOps Test
[Back to root README.md](/README.md)

# Task 2 K8S FTW [15 pts]
Write a Kubernetes StatefulSet to run Task-01, using persistent volume claims and resource limits.




## Usage
```bash
[nd@nd-wl task-02]$ kubectl apply -f litecoin.yaml
statefulset.apps/litecoin-18-1 created
storageclass.storage.k8s.io/fast created
service/litecoin-runner created
[nd@nd-wl task-02]$ cat litecoin.yaml 

```


Statefull set with persistent volume claim with a pod of 1 on minikube using local repo
![minikube](https://raw.githubusercontent.com/chris17453/kraken-devops/master/media/task-02-demo.gif)



## thoughts
I just took down my k8 cluster. I threw up minikube on my local machine to demo this. 
I did google a few things because i dont k8 as often as I like. Though I've  migrated, built and ran quite a bit of it. It's more like a first date experience every time. I get to touch it and play with it for the task. Then I dont need it anymore till I do. 

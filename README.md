---
layout: default
title: Test
nav_order: 2
has_children: true
---
# Kraken DevOps Test

## General rule
You can copy, search, google, duckduckgo, stackoverflow, github or otherwise source your
answers without losing marks, but:
- If you copy something verbatim you must reference it (for example in an inline comment),
- If there are not already comments explaining what it does you must add some.

You should endeavour to test that what you've copied / amended works and fulfils the objective, nonetheless.
Generally speaking, there will be marks for just achieving anything at all (unless you copied it without
referencing), plus some for each sub-requirement, and then a few for style and explanation. Please don't spend
too long. A couple of hours should suffice - maybe a little more if you have to pick stuff up as you go along.
Questions 1-3 are mandatory - you can skip any of the subsequent questions, but you need to write a very short
explanation as to why (e.g. I've never used this technology, and it's not on my CV; or I spent too much time on the
other questions).


## Task 1 Docker-ayes [20pts]
 Write a Dockerfile to run Litecoin 0.18.1 in a container. It should somehow verify the checksum of
the downloaded release (there's no need to build the project), run as a normal user, and when run without any
modifiers (i.e. docker run somerepo/litecoin:0.18.1) should run the daemon, and print its output to the console.
The build should be security conscious (and ideally pass a container image security test such as Anchore). 
- [Task 01](task-01/)


## Task 2  K8S FTW [15 pts]
Write a Kubernetes StatefulSet to run the above, using persistent volume claims and resource limits.
- [Task 02](task-02/)


## Task 3  All the continuouses [15 pts]
Write a simple build and deployment pipeline for the above using groovy / Jenkinsfile, Travis CI or Gitlab CI. 
- [Task 03](task-03/)


## Task 4 Script kiddies [10pts]
Source or come up with a text manipulation problem and solve it with at least two of awk, sed, tr
and / or grep. Check the question below first though, maybe.
- [Task 04](task-04/)


## Task 5 Script grown-ups [15pts]
Solve the problem in question 4 using any programming language you like. 
- [Task 05](task-05/)


## Task 6 Terraform lovers unite [25pts]
Write a Terraform module that creates the following resources in IAM;
- A role, with no permissions, which can be assumed by users within the same account,
- A policy, allowing users / entities to assume the above role,
- A group, with the above policy attached,
- A user, belonging to the above group.


All four entities should have the same name, or be similarly named in some meaningful way given the
context e.g. prod-ci-role, prod-ci-policy, prod-ci-group, prod-ci-user; or just prod-ci. Make the suffixes
toggleable, if you like. 
- [Task 06](task-06/)

## Formatting and content
- style [10pts]
- substance [10pts]

## Submissions
You can submit your work by email as plain text attachments, or a zip file, or you can pop this all in an online source code repository such as Github. Marks out of a hundred. Pass mark is 35. Good luck!



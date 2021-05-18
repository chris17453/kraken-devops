# Kraken DevOps Test
[Back to root README.md](/README.md)

## Task 5 Script grown-ups [15pts]

Solve the problem in question 4 using any programming language you like.

### Task 4 reference
- Source or come up with a text manipulation problem and solve it with at least two of awk, sed, tr and / or grep. Check the question below first though, maybe.




# sed & tr text replacement
```
make py-munge

[nd@nd-wl task-05]$ make py-munge
--- Rules ---
 Replace 
 - {casual name} -> Chris
 - {full name} -> Charles Watkins
  - only lines that do not start with a #
 - Replace ( with '
 - Replace ) with '

--- Original ---
Hi I'm {casual name} ({full name})
# Hi I'm {casual name} ({full name})   //This line should never be replaced
This is an example of using `sed` for textual replacment
This is a 4 line file.

 
--- Results ---
Hi I'm Chris 'Charles Watkins'
# Hi I'm {casual name} '{full name}'   //This line should never be replaced
This is an example of using `sed` for textual replacment
This is a 4 line file.

 

```

## validation
compare task 4 md5 with task 5 md5 for validation
```bash 
make verify
[nd@nd-wl task-05]$ make verify
Output Good - MD5 Sums of task 04 - 05 match

```

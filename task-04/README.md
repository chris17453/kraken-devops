# Kraken DevOps Test
[Back to root README.md](/README.md)

## Task 4 Script kiddies [10pts]
Source or come up with a text manipulation problem and solve it with at least two of awk, sed, tr and / or grep. Check the question below first though, maybe.



# sed & tr text replacement
```
make sed

[nd@nd-wl task-04]$ make sed
cat data.txt | sed "/^[^#]/s/{casual name}/Chris/g" | tr "(" "'"|tr ")" "'"|sed  "/^[^#]/s/{full name}/Charles Watkins/g">data_results.txt
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

This is all original, and simple. I did google arround for ideas mostly due to the fact that I awk far less than I sed and I normally dont pair tr with anything but a pipe when cutting. For example looking for CPU STEAL, I would cat some /proc items, do a cut, grep, sort and maybe a tr


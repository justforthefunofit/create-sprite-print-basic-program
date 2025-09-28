# Merging TWO BASIC Program Files — part-1 + part-2

This little guide shows how to **merge two BASIC program files** named `part-1` and `part-2` into a single, running program.  
The method is based on the *merging procedure* described in *Peeks and Pokes on the Commodore 64* (Liesert, 1st edition, 1985), page 41.
A pdf document of this can be found on the web-archive. 

This we now use to merge the generated sprite printing lines with the program in which we want to use them.

---

## 🧩 Step-by-Step Merge Guide 

### 1️⃣ Load the first part  
- Load `part-1` into memory (e.g. `LOAD "part-1",8`).  
- Make sure it sits safely in memory.

### 2️⃣ Note the end-of-program pointer  
- Find the memory address at the end of `part-1` (this is where the next line will be appended).  
- This address is stored in pointers at the top of BASIC memory.
- for this we read the memory location using the peek command:
<code>
  print peek(43), peek(44)    make a note of those two values
  poke 43, (peek(45)+256*peek(46)-2) and 255
  poke 44, (peek(45)+256*peek(46)-2)/256
  new
</code>

### 3️⃣ Load the second part   
- Use `LOAD "part-2",8  
- This loads part-2 directly after part-1 in memory.

### 4️⃣ Fix the pointers  
- Update the first two bytes (low, high) of part-2’s first line to point to the correct memory address where part-2 now resides.  
- this we do with the two value we fount with the peek (43) and peek(44)
 <code>
  poke 43, value-1
  poke 44, value-2
  </code>
  
### 5️⃣ Save the combined program  
- Once merged and pointer-adjusted, save the entire combined program (e.g. `SAVE "merged",8`)  
- You now have a single file that runs both parts in sequence.  

---

## 🔍 Notes & Tips

- Always backup the originals before merging.
  
---
## Combining the parts
![combining](https://github.com/user-attachments/assets/c9a77310-5670-4400-bdbf-bd35b9aa0f1c)

---
## Using the merged program
As an exmample here the combined programs and a small example on how to use the sprite definion part and the part to show the sprite. 

![use-combined](https://github.com/user-attachments/assets/c7de00c2-08ef-467a-a76e-7a0b59ff4ec5)

---

## Example showing speed
Here the final result showing how fast it can be reprogramming a sprite by using the print command.
![sprite-printing](https://github.com/user-attachments/assets/ae4e8c2e-d626-4dec-b4e6-4c25b9988b24)


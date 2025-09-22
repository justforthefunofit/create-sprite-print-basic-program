# 💾 Proof of Concept – Using PRINT to Save Memory Blocks

This little demo is just for the fun of it 😉.  
It shows that you don’t *always* need `POKE` when you want to mess around with memory on a Commodore 64.  
With a bit of creativity, the humble `PRINT` command can do the job too!

---

## 📝 Step-by-step explanation (Jef’s style)

### 🔹 Lines 100–190 – What’s the plan?
Here we explain what the program is about.  
The idea:  
- Use `PRINT` to place values directly into memory (instead of `POKE`).  
- In this case, we use **screen memory** as a storage area.  
- Later we calculate the start and end address of that memory block.  
- Finally, we call the **standard Commodore save routines** to write it all to disk.

So basically: PRINT → Memory → Save 🚀

---

### 🔹 Line 200 – Clear the screen
We wipe the screen clean with `PRINT CHR$(147)`.  
Fresh start, no distractions.

---

### 🔹 Line 210 – PRINTing into memory
Here’s where the magic happens ✨.  
We print a carefully crafted string that translates into the correct memory values.  
This simulates a BASIC line being defined directly in memory, using nothing more than `PRINT`.

So instead of poking every byte by hand, we just print it all at once.

---

### 🔹 Lines 220–230 – Preparing to save
We show `"saving..."` on screen, and then calculate the **start** and **end addresses** of the memory block.  
These addresses tell the C64 exactly what chunk of memory we want to write out.

---

### 🔹 Lines 250–270 – Saving the block
Now the real saving happens:  
- `SYS 57812` initializes the save with a filename.  
- A couple of `POKE`s set the correct start and end addresses.  
- And finally, `SYS 62957` writes the memory block to disk.

Done ✅ The block that was created with `PRINT` is now a file on disk.

---

## 🎯 Why is this interesting?
It proves that `PRINT` can be used in place of `POKE` for memory manipulation.  
That means we can generate BASIC lines, sprite data, or other memory content in a much simpler way — and then save it out like any normal program.

A neat little trick for anyone experimenting with C64 internals 😎.

---

🔗 **Extra reading:**  
If you want to dive deeper into how BASIC tokens and memory work:  
👉 [C64-Wiki: BASIC token](https://www.c64-wiki.com/wiki/BASIC_token)

---

### Result
execution:
<img width="889" height="569" alt="image" src="https://github.com/user-attachments/assets/7ab0fa7c-0f43-4d4c-b494-2df9a8e327c1" />

**Memory (sreen)**
<img width="803" height="83" alt="image" src="https://github.com/user-attachments/assets/bf6acb43-79d9-4621-9478-6d93d4bf616d" />

**Memory (start of basic)**
<img width="801" height="76" alt="image" src="https://github.com/user-attachments/assets/a2596841-3470-469d-8746-cd999d7c5657" />

The program can be found here: [`save-memory-block.bas`](./save-memory-block.bas)  



Just for the fun of it 💙

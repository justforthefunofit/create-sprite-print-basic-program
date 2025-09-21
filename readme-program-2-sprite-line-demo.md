# Step-by-Step Guide: Creating BASIC Program Lines in Memory

Welcome, retro coders! This guide walks you through a Commodore 64 BASIC example that demonstrates how to **create BASIC program lines in memory**. This is an essential step for generating the special strings that can later be printed directly to program sprite memory using the `PRINT` command.  

Think of it as the foundation for sprite programming — simple, step-by-step, and fun!  

---
# first have a look how a basic program lookes like in memory

<p align="center">
<img width="60%" height="60%" alt="image" src="https://github.com/user-attachments/assets/3c2de9da-c9d7-4392-8c77-745d7b237568" />
</p>

---

## 1️⃣ Setup (Lines 100–130)
We start by clearing the screen and preparing memory areas:  
- `dm = 2049` → base destination memory for BASIC lines  
- `sm = 1024` → base screen memory for demo display  
- `bl(255)` → array to store individual BASIC line bytes  

This sets the stage for line creation and visualization on-screen.  

---

## 2️⃣ Define the first BASIC line (Lines 150–230)
Here’s what happens:  
1. Define the demo string `d$ = "hello world …"`  
2. Set the starting line number `ln = 100`  
3. Use a subroutine to convert the string into the internal tokenized BASIC line format  
4. Place the line at the start of memory for proper chaining  
5. Display the line in screen memory for demonstration  

This gives you a first working line of BASIC in memory, ready to be extended.  

---

## 3️⃣ Define the second BASIC line (Lines 250–310)
The process is repeated for the next line:  
1. Define `d$ = "next line demo …"`  
2. Set line number `ln = 110`  
3. Convert it into a tokenized BASIC line  
4. Place it in memory immediately after the first line  
5. Show it on the screen  

Now we have **two connected BASIC lines** in memory.  

---

## 4️⃣ End marker and save (Lines 330–370)
Once all lines are in memory:  
- Place an end-of-program marker  
- Update the screen memory to include the last line  
- Save the memory block to disk using standard CBM routines  

This ensures your BASIC program is **fully intact** and ready to run.  

---

## 5️⃣ Subroutines Overview

### Create tokenized PRINT line (Lines 400–550)
- Converts a string into a sequence of PETSCII codes suitable for memory  
- Handles the line number, `PRINT` token, quotes, and semicolon  
- Stores the result in the `bl()` array  

### End marker (Lines 560–610)
- Adds `0,0` to mark the end of the BASIC program  

### Place next line address (Lines 620–680)
- Updates the first two bytes of the line array to point to the next line in memory  

### Print line to memory (Lines 690–730)
- POKEs each byte of the line array into the designated screen or BASIC memory  

### Save memory block to disk (Lines 740–820)
- Uses CBM DOS routines to write the memory block to disk  
- Ensures your generated program is permanently stored  

---

## 6️⃣ How to use
1. Load the separate BASIC file: [sprite-line-demo.bas](./sprite-line-demo.bas)  
2. Run it on a Commodore 64 emulator or real machine  
3. Observe how the tokenized BASIC lines appear in memory and on-screen  
4. Use this technique to generate sprite strings for printing into memory  

---

### ✅ Why this is useful
- Learn how BASIC lines are **structured in memory**  
- Understand **tokenized PRINT statements**  
- Use the technique to create **fast, memory-efficient sprite routines**  
- Fun and educational, just for the fun of it 🎉

## Result
<p align="center">
<img width="75%" height="75%" alt="image" src="https://github.com/user-attachments/assets/b4c38c8e-c3f8-40e4-bfe0-6bdd250a5b8e" />
</p>


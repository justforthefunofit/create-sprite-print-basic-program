# Step-by-Step Guide: Generating Sprite BASIC Program Lines

This Commodore 64 BASIC example shows how to **generate three sprites** as **tokenized BASIC lines** that print the sprite data using `PRINT` in PETSCII code.  

These three lines can then be used in **any BASIC program** to efficiently program sprite memory, saving memory and execution time.  

Think of it as **classic Commodore magic**, done just for the fun of it — clear, and educational!

---

## 1️⃣ Setup (Lines 1000–1130)
We begin by initializing memory and clearing the screen:  
- `bl(255)` → array to store each BASIC line  
- `dm = 2049` → base memory address for BASIC program  
- `sm = 1024` → base screen memory address for demo  
- Clear the screen and print a message to indicate start  

This sets the stage for generating sprite strings.  

---

## 2️⃣ Read Sprite Data (Lines 1150–1210)
- Loop through the 3 sprites  
- Loop through the 63 bytes per sprite  
- Convert each byte to the corresponding PETSCII value using a subroutine  
- Build a string `ps$(i)` representing the sprite in memory-ready format  

At the end of this step, each sprite is represented as a **ready-to-print string**.  

---

## 3️⃣ Define BASIC Program Lines (Lines 1240–1350)
- Assign the screen (`ts`) and memory (`tm`) start addresses  
- Loop through each sprite string to create a BASIC line:  
  1. Copy sprite string into `d$`  
  2. Set the BASIC line number (`ln`)  
  3. Call subroutine to convert it into a tokenized line  
  4. Update memory pointers and place the line on screen  
  5. Increment line number for the next sprite  

After this step, **three connected BASIC lines** exist in memory.  

---

## 4️⃣ End Marker & Save Program (Lines 1370–1410)
- Place **end-of-program marker** to mark last line  
- Update screen memory for display  
- Save the memory block to disk using CBM DOS routines  

Your BASIC program is now **fully saved and ready for use**.  

---

## 5️⃣ Subroutines Overview

### Convert Byte to PETSCII (Lines 1460–1570)
- Maps a sprite byte (0–255) to corresponding PETSCII characters  
- Handles `INVERSE ON/OFF` and multicolor for the VIC-II sprite memory  

### Create Tokenized BASIC Line (Lines 1580–1740)
- Adds `PRINT` token, quotes, semicolon, and colon separator  
- Converts the sprite string into a tokenized BASIC line stored in `bl()`  

### End Marker (Lines 1760–1800)
- Adds `0,0` to mark the end of the BASIC program  

### Place Next Line Address (Lines 1810–1870)
- Updates the first two bytes of `bl()` to point to the next line in memory  

### Place BASIC Line in Memory (Lines 1880–1920)
- POKEs the `bl()` array into screen or BASIC memory  

### Save Memory Block to Disk (Lines 1930–2010)
- Uses CBM standard routines to write the memory block to disk  

---

## 6️⃣ Sprite Data (Lines 2020–2700)
- The program contains **three sets of sprite bytes**  
- Each set is 63 bytes, representing a 24×21 pixel sprite  
- These bytes are converted into **PETSCII strings** and stored as tokenized BASIC lines  

---

## 7️⃣ How to Use
1. Load the separate BASIC file: [`sprite-generator.bas`](./sprite-generator.bas)  
2. Run it on a **Commodore 64 emulator or real C64**  
3. Observe how **tokenized BASIC lines** are created for each sprite  
4. Use the generated lines in **any BASIC program** to program sprite memory quickly and efficiently  

---

### ✅ Why This Rocks
- Learn **how BASIC lines are structured in memory**  
- Create **fast, memory-efficient sprite routines**  
- Perfect for retro enthusiasts and Commodore hobby programmers  
- another just for the fun of it example: **clear, fun, and hands-on!** 🎉

<img width="50%" height="50%" alt="image" src="https://github.com/user-attachments/assets/e158fc0a-64de-4b9f-a835-b968221e40eb" />
<img width="50%" height="50%" alt="image" src="https://github.com/user-attachments/assets/505a4738-5efa-4cb6-89bb-23c29ec9e6b5" />




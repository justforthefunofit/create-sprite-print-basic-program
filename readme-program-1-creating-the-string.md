# Step-by-Step Sprite Printing Guide

Welcome, retro coders! In this guide, I’ll show you a clever Commodore 64 trick: using **PRINT** instead of the usual **POKE** command to fill sprite memory. It’s faster, cleaner, and a lot more fun.  

---

## 1️⃣ Clear the screen (Lines 1080–1090)
Start with a clean slate. PRINT can be used to directly manipulate the screen memory where sprites will appear. No POKEs, no fuss.  

---

## 2️⃣ Prepare your sprite (Lines 1400–1470)
Before we print anything, set up your sprite parameters:  
- Make the sprite visible  
- Set its colors  
- Enable multicolor mode  
- Set its position  

This is done with a simple setup subroutine (see code file).  

---

## 3️⃣ Read sprite data (Lines 1110–1180)
The program reads all sprite bytes and converts them into PETSCII characters. Each byte is transformed depending on its value so it can be printed directly into memory.  

This conversion handles values from 0–255 in a way that respects Commodore 64 quirks like color codes and cursor functions.  

---

## 4️⃣ Build printable strings (Lines 1150–1180)
All converted bytes are concatenated into strings. These strings are ready to be printed to the screen memory. Each sprite gets its own string.  

---

## 5️⃣ Print and animate (Lines 1220–1250)
Printing the strings into memory shows the sprite on-screen instantly. Looping through multiple strings lets you animate the sprites without ever touching POKE commands.  

---

## 6️⃣ Sprite data (Lines 1570–2220)
The sprite data is stored as `DATA` statements. Instead of poking each byte, the program builds printable strings automatically.  

---

## 7️⃣ Advantages
- **Faster than POKE**: PRINT fills memory much quicker  
- **Less typing**: no tedious POKE loops  
- **Retro fun**: see your sprites appear and animate instantly  

---

### ✅ How to use the code
The full BASIC program is in a separate file: [sprite-printing.bas](./sprite-printing.bas)  

Load it into your favorite editor (like CBM prg Studio) and run. Watch your sprites come to life 🎉
<p align="center">
<img width="50%" height="50%" alt="image" src="https://github.com/user-attachments/assets/8343995d-2006-4b2b-8c4a-2058a78cbca8" />
</p>

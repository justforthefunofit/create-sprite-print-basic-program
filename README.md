# PRINT vs POKE – Sprite Builder in BASIC  

This repository is a follow-up to my earlier project where I explained how to use the `PRINT` command instead of the usual `POKE` to manipulate memory on the Commodore 64.  
That trick made it possible to define sprites faster by printing specially formed strings directly into screen memory.  

---

## What’s new here?  

This time, no Excel macro needed!  
Instead, the conversion is done fully in **Commodore BASIC**.  

- The program takes a normal sprite definition written with `DATA` statements.  
- It automatically generates a set of BASIC lines.  
- These lines can be **saved to disk** as their own program.  

Load that generated program back, run it, and *voilà* — your sprite is instantly created.

---
## Defining the example sprite
I used the online sprite creator at https://petscii.krissz.hu/ to create a simple sprite as an example in the code.
<p align="center">
<img width="50%" height="50%" alt="image" src="https://github.com/user-attachments/assets/9af347eb-5fc2-4b7a-8ae7-14ca1f95d443" />
</p>

## Use the sprite data
From this online sprite creator I exported the definition in raw byte format and then converted it to basic lines. Replaced, by search and replace, 'BYTE' to 'data' en then copied it to CBM prg studie to add linenumers to it. 

like this:
<p align="center">
<img width="25%" height="25%" alt="image" src="https://github.com/user-attachments/assets/a1b8f222-7a33-4957-a4e5-5cc55aa046c3" />
<img width="25%" height="25%" alt="image" src="https://github.com/user-attachments/assets/8f33b768-3328-4d0e-9b33-10420eb44d45" />
</p>

## Examples:
- Program showing how to create the string from normal sprite definition  [readme](./readme-program-1-creating-the-string.md)  [Code](./sprite-printing.bas)
- Proof of concept to demonstrate creating of a basic program line [readme](./readme-save-memory-block.md) [Code](./save-memory-block.bas)
- Program showin how to create a basic program with the appropriate basic code lines [readme](./readme-program-2-sprite-line-demo.md)  [Code](./sprite-line-demo.bas)
- Example program generating actual basic lines to be used in your program [readme](./readme-program-3-generate-the-basic-program.md)  [Code](./sprite-generator.bas)
- Example on hoe to concatenate two basic programs so the sprite definition can be used (next on my list to create the example)


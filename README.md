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

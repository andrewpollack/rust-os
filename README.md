# Rust OS
*Writing an Operating System (OS) in Rust (https://os.phil-opp.com/)*

## Description
Building from scratch can be one of the best ways to learn the "why" behind the "how". This project is a guided tour of OS development, following the fantastic resource at https://os.phil-opp.com/. 

## Why Rust?
In a world where C/C++ are great ways to develop an OS, why choose Rust? Aside from my desire to continue development and growth in Rust, there are several great reasons to use Rust for systems projects:
1. **Memory safety enforced at compilation.** Thanks to its variable ownership rules, Rust provides great guarantees around memory safety for standard code usage. This in-itself drastically reduces the vectors of potential attacks. The lower down the stack you go, the easier life is for everyone. 
2. **Auditability.** Rust offers a break from these enforced memory safety guarantees via the keyword `unsafe`. Of note, `unsafe` *is not a sign that the code you are writing is wrong and/or bad*. Especially when writing systems programs, the keyword will pop up and you will need to use it. What it does offer is the ability for the code to be highly auditable, reducing the space that a bug can exist in. All to say: would you rather be auditing 10,000 lines of C code, or 9,750 lines of Rust code with 250 lines of `unsafe` code?
3. **Tooling and community.** Rust has a vibrant community to help build tooling, and a community that is open and welcome. From linting to docs-tests, Rust has much to offer for the development experience.

## Running notes
*These notes are helpful for keeping project decisions/progress for myself.*
* First step in creating our OS kernel is to create a Rust executable that doesn't link the standard library. Portions of standard library require OS abstractions or specific hardware that is not in scope for the OS. We must be able to execute the freestanding code without an underlying operating system.
* Disabling the standard library is easy through `#![no_std]`. Along with this comes disabling of basic constructs such as the `panic_handler` function, `eh_personality`, and even entrypoint. Work must be done to get a basic `main` running.
* Linker will look for a function called `_start` as the entrypoint by default. It can find it, so long as the name is not mangled.
* For a minimal kernel, we'll look to implement support for BIOS booting. UEFI is newer, but BIOS will be support.
* BIOS can be loaded from flash memory on the motherboard. This is followed by control transfer to the bootloader, which is a 512-byte portion of executable code at the beginning of the disk. This will typically be at the beginning of the disk, hence how it is consistently found.
* Subsequent stages larger than 512 bytes are stored elsewhere, and specified by the initial 512 byte portion. Additionally, the bootloader will switch the CPU from 16-bit real mode, into 32-bit protected mode, and then 64-bit long mode to get all 64-bit registers and memory ranges available. Lastly, it will query information (e.g. memory map) from BIOS to pass to OS kernel.
* Additional memory-related manipulations are handled by `compiler-builtins-mem`.
* Printing to screen starting with VGA text buffer.

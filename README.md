# Rust OS
*Writing an Operating System (OS) in Rust (https://os.phil-opp.com/)*

## Description
Building from scratch can be one of the best ways to learn the "why" behind the "how". This project is a guided tour of OS development, following the fantastic resource at https://os.phil-opp.com/. 

## Why Rust?
In a world where C/C++ are great ways to develop an OS, why choose Rust? Aside from my desire to continue development and growth in Rust, there are several great reasons to use Rust for systems projects:
1. **Memory safety enforced at compilation.** Thanks to its variable ownership rules, Rust provides great guarantees around memory safety for standard code usage. This in-itself drastically reduces the vectors of potential attacks. The lower down the stack you go, the easier life is for everyone. 
2. **Auditability.** Rust offers a break from these enforced memory safety guarantees via the keyword `unsafe`. Of note, `unsafe` *is not a sign that the code you are writing is wrong and/or bad*. Especially when writing systems programs, the keyword will pop up and you will need to use it. What it does offer is the ability for the code to be highly auditable, reducing the space that a bug can exist in. All to say: would you rather be auditing 10k lines of C code, or a 9.75k lines of Rust code with a 250 lines of `unsafe` code? 
3. **Tooling and community.** Rust has a vibrant community to help build tooling, and a community that is open and welcome. From linting to docs-tests, Rust has much to offer for the development experience.

# Caesar Cipher – Activity 1

This project implements the **Caesar Cipher** for Activity 1 of the assignment.
The script rotates all alphabetic characters (A–Z, a–z) by a specified rotation.
If no rotation value is provided, the default is **13** (ROT13).

The program reads from **standard input** and writes the encrypted text to
**standard output**.

---

## Usage

usage: caesar.sh [rotation]


- If **[rotation]** is omitted → default rotation = **13**
- If **-h** is passed → usage message is displayed
- If **more than one argument** is provided → usage is displayed and the program exits

---

## Features

- Works with uppercase (A–Z) and lowercase (a–z)
- Preserves punctuation, digits, and whitespace
- Supports both positive and negative rotation values
- Automatically normalizes rotation to the range **0–25**
- Implemented using basic shell tools (`cut`, `tr`)

---

## How It Works

1. The script checks the command-line arguments.
2. If `-h` is provided, it prints a usage message and exits.
3. Rotation is taken from the first argument or defaults to **13**.
4. The rotation is normalized using `% 26` to keep it within **0–25**.
5. Two alphabet strings are defined:
   - `ABCDEFGHIJKLMNOPQRSTUVWXYZ`
   - `abcdefghijklmnopqrstuvwxyz`
6. Each alphabet is rotated using the `cut` command:
   - first part: from `(rotation + 1)` to the end
   - second part: from the start to `rotation`
7. The `tr` command maps the original alphabet to the rotated alphabet.
8. Input is read from **stdin** and processed by `tr`.

---

## Examples

### Default rotation (ROT13)

```bash
echo "Hello World!" | ./caesar.sh
```
Custom rotation

```bash
echo "Attack at dawn!" | ./caesar.sh 5
```
Using a negative rotation

```bash
echo "Dro aesmu lbygx pyh tewzc yfob dro vkji nyq." | ./caesar.sh -10
```
Show help

```bash
./caesar.sh -h
```
Requirements

-Bash
-POSIX shell utilities (cut, tr)

No external dependencies are required.

Notes

-Only alphabetic characters are rotated.
-Uppercase and lowercase letters are rotated separately.
-The script expects input from stdin, so piping or echo works naturally.

Example:
```bash
./caesar.sh 13
```
Hello world!
<CTRL+D>

Author
Written as part of Activity 1: Caesar Cipher for the homework assignment.

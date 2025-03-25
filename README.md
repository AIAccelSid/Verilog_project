# Linear Feedback Shift Register (LFSR)

A **Linear-Feedback Shift Register (LFSR)** is a type of shift register where the input bit is a linear function (typically an XOR operation) of its previous state. It is widely used in applications such as:

- Pseudo-random number generation
- Whitening sequences
- Pseudo-noise sequences
- Cryptographic applications
- Error detection and correction codes

## 4-bit Pseudo-Random Sequence Generator

This implementation demonstrates a **4-bit LFSR** where the feedback function is based on XORing specific taps.

### Working Principle
At each clock cycle:
1. Compute: `Q[3] ⊕ Q[2]` (XOR operation)
2. Shift register left by 1 bit: `Q = Q << 1`
3. Insert the XOR result into the LSB (0th bit)

### Taps
In this **4-bit LFSR**, the taps are **bit positions 4 and 3** (zero-based index: `Q[3]` and `Q[2]`).

### Example Implementation (Verilog)
```verilog
module LFSR_4bit(
    input clk,
    input rst,
    output reg [3:0] Q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 4'b0001; // Initial nonzero seed
        else
            Q <= {Q[2:0], Q[3] ^ Q[2]};
    end
endmodule
```

### Sequence Example (Starting with `0001`)
| Cycle | Q[3] | Q[2] | Q[1] | Q[0] | XOR(Q[3], Q[2]) |
|--------|------|------|------|------|----------------|
| 1      | 0    | 0    | 0    | 1    | 0              |
| 2      | 0    | 0    | 1    | 0    | 0              |
| 3      | 0    | 1    | 0    | 0    | 1              |
| 4      | 1    | 0    | 0    | 1    | 1              |
| ...    | ...  | ...  | ...  | ...  | ...            |

### Key Properties
- Generates a **pseudo-random sequence** with a maximum period of `(2^n - 1)`, excluding the all-zero state.
- Used in **digital communication systems, cryptography, and error checking.**
- Efficient hardware implementation with **minimal logic gates.**

---

## References
- Digital Design by Morris Mano
- Cryptographic Applications of LFSRs
- Hardware Random Number Generators


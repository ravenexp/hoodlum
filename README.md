# hoodlum

HDL generation library for hardware synthesis.

```rust
let code = hdl! {

entity Main (clk: in, LED1: out) {
    let light: reg[1] = 1;

    on clk.posedge {
        light <= !light;
    }

    always {
        LED1 = light;
    }
}

};

let verilog = code.to_verilog(&Default::default());
```

Goals:

1. Emit compatible Verilog and VHDL code.
1. Define a DSL that's as simple (and Rust-like) as possible.
1. Create abstractions to simplify generation of state machines and complex logic.
1. Detect errors before they reach synthesis stage.
1. In the future, add simulation capabilities.

Non-goals:

1. Don't compile Rust into HDL. Rust's stdlib fits an entirely different computing
   model. The abstraction mismatch makes bad output.
1. Don't support all features of Verilog 2005 or VHDL, just a functional subset.

## License

MIT or Apache-2.0.

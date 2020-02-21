extern crate rand;
use rand::Rng;
use std::ptr;

#[rustler::nif]
fn add(a: i64, b: i64) -> i64 {
    a + b
}

#[rustler::nif]
fn panic() {
    panic!("BOOM!")
}

#[rustler::nif]
fn crash() {
    // create a null pointer
    let p: *const i32 = ptr::null();
    // https://doc.rust-lang.org/book/ch19-01-unsafe-rust.html
    unsafe {
        // dereferencing a raw pointer can only be done in an unsafe block
        // but dereferencing a NULL pointer is undefined behavior!
        // and likely to cause a segmentation fault and program crash
        println!("{:?}", *p);
    }
}

#[rustler::nif]
fn generate(num: i64, upper: i64) -> Vec<i64> {
    let mut rng = rand::thread_rng();

    // rust ranges are "half open"
    // so (0..5) has a length of 5
    // https://doc.rust-lang.org/std/ops/struct.Range.html
    (0..num)
        .map(|_| {
            // gen_range includes the lower bound
            // but excludes the upper bound
            // so we add 1 to upper to match the elixir implementation
            // https://docs.rs/rand/0.7.3/rand/trait.Rng.html#method.gen_range
            rng.gen_range(1, upper + 1)
        })
        .collect()
}

#[rustler::nif]
fn sort(ints: Vec<i64>) -> Vec<i64> {
    let mut copy = ints.clone();
    copy.sort();

    copy
}

rustler::init!("Elixir.MyNif", [add, panic, crash, generate, sort]);

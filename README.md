# Shadow-cljs Advanced Compilation Reproduction

## Problem

Given code like the following:

```clj
(subs nil 1 2)
```

A release build from shadow with `:optimizations :advanced` will cause the
Google Closure compiler to optimize the code away to `null`, in the compiled
js. While it makes sense for app development, this can be a surprise when
writing a test like:

```clj
(is (thrown? (subs nil 1 2))
```

This will fail the assertion in the compiled js.


## Testing

First install deps

```sh
npm install
```

Build the js

```sh
npm run build
```

Run the tests

```sh
npm run test
```

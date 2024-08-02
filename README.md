# mlir-tutorial

## Build system

```
bazel build @llvm-project//mlir:IR
bazel build @llvm-project//mlir/...:all
bazel run @llvm-project//mlir:mlir-opt -- --help
```

workspace(name = "mlir_tutorial")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

LLVM_COMMIT = "0b92e70dfb7a3b49c24157d0a1b93d127f622683"

LLVM_SHA256 = "0a6d078cee61bcd60250f039a419235215096a564e0f5bb98f8872445fb09742"

http_archive(
    name = "llvm-raw",
    build_file_content = "# empty",
    sha256 = LLVM_SHA256,
    strip_prefix = "llvm-project-" + LLVM_COMMIT,
    urls = ["https://github.com/llvm/llvm-project/archive/{commit}.tar.gz".format(commit = LLVM_COMMIT)],
)

# This is needed since https://reviews.llvm.org/D143344.
# Not sure if it's a bug or a feature, but it doesn't hurt to keep an additional
# dependency here.
http_archive(
    name = "llvm_zstd",
    build_file = "@llvm-raw//utils/bazel/third_party_build:zstd.BUILD",
    sha256 = "7c42d56fac126929a6a85dbc73ff1db2411d04f104fae9bdea51305663a83fd0",
    strip_prefix = "zstd-1.5.2",
    urls = [
        "https://github.com/facebook/zstd/releases/download/v1.5.2/zstd-1.5.2.tar.gz",
    ],
)

# This is needed since https://reviews.llvm.org/D143320
# Not sure if it's a bug or a feature, but it doesn't hurt to keep an additional
# dependency here.
http_archive(
    name = "llvm_zlib",
    build_file = "@llvm-raw//utils/bazel/third_party_build:zlib-ng.BUILD",
    sha256 = "e36bb346c00472a1f9ff2a0a4643e590a254be6379da7cddd9daeb9a7f296731",
    strip_prefix = "zlib-ng-2.0.7",
    urls = [
        "https://github.com/zlib-ng/zlib-ng/archive/refs/tags/2.0.7.zip",
    ],
)

# The subset of LLVM backend targets that should be compiled
_LLVM_TARGETS = [
    "X86",
    # The bazel dependency graph for mlir-opt fails to load (at the analysis
    # step) without the NVPTX target in this list, because mlir/test:TestGPU
    # depends on the //llvm:NVPTXCodeGen target, which is not defined unless this
    # is included. @j2kun asked the LLVM maintiners for tips on how to fix this,
    # see https://github.com/llvm/llvm-project/issues/63135
    "NVPTX",
]

load("@llvm-raw//utils/bazel:configure.bzl", "llvm_configure")

llvm_configure(
    name = "llvm-project",
    targets = _LLVM_TARGETS
)

const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // test_ziglib_dep is a dependency of type "pkg"
    const test_ziglib_dep = b.dependency("test_ziglib", .{});
    const exe = b.addExecutable(.{
        .name = "test_zigapp",
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });
    // exe.linkLibrary(raylib_dep.artifact("test_ziglib"));
    // access the as public created module test_ziglib within package test_ziglib
    exe.root_module.addImport("test_ziglib", test_ziglib_dep.module("test_ziglib"));
}

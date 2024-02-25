const std = @import("std");
const test_ziglib = @import("test_ziglib");

pub fn main() !void {
    test_ziglib.test123();
}

test "simple test" {
    test_ziglib.test123();
}

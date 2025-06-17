const std = @import("std");
const ezig_templates = @import("ezig_templates");

pub fn main() !void {
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);

    const Props = struct { name: [:0]const u8 };
    const props = Props{ .name = "World" };
    try ezig_templates.@"hello_world.html"(Props, bw.writer().any(), props);

    try bw.flush();
}

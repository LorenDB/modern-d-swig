// SPDX-FileCopyrightText: 2020 Loren Burkholder <computersemiexpert@outlook.com>
// SPDX-License-Identifier: MIT

import std.stdio;
import std.file;
import std.string;
import std.array;

void main(string[] args)
{
	// arg format: appname file-to-convert.d
	// File file = File("test", "rw");
	if (args.length != 2)
	{
		writeln("Syntax: ", args[0], " path/to/file/to/convert.d");
		return;
	}
	// File file = File(args[1], "rw");
	string contents = readText(args[1]);
	contents = contents.replace("std.c.", "core.stdc."); // sub-imports (like std.c.foo)
	contents = contents.replace("std.c;", "core.stdc;"); // end of import statements (like import std.c;)
	contents = contents.replace("std.c ", "core.stdc ");
	contents = contents.replace("std.c:", "core.stdc:");
	// etc. etc. etc.
	std.file.write(args[1], contents);
}

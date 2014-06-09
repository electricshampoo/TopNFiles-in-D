void main(string[] argv){
    import std.stdio, std.file, std.container, std.conv, std.algorithm;

    auto startDir = argv[1];
    DirEntry[] arr;
    arr.length = to!uint(argv[2]);
    auto heap = BinaryHeap!(DirEntry[], "a.size > b.size")(arr, 0);

    foreach(DirEntry e; dirEntries(argv[1], SpanMode.depth))
        if(!e.isSymlink)
            heap.conditionalInsert(e);

    foreach (e; sort!"a.size > b.size"(heap.release))
        writeln(e.name ~ " " ~ to!string(e.size));

}

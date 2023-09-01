import alignment_c;

pragma(msg, cmd_t.sizeof);
static foreach(member; __traits(allMembers, cmd_t)) {
   mixin("pragma(msg, \"offset "~member~" = \", cmd_t." ~ member~".offsetof);");
}


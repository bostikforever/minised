module alignment;

struct	cmd_t			/* compiled-command representation */
{
	char	*addr1;			/* first address for command */
	char	*addr2;			/* second address for command */
	private union U
	{
		char	*lhs;	/* s command lhs */
		cmd_t	*link;	/* label link */
	}
    U u;
	char	command;		/* command code */
	char	*rhs;			/* s command replacement string */
	import core.stdc.stdio;
	FILE* fout;	 	/* associated output file descriptor */

   private struct Flags
   // {
   // 	align(1):
   //    import std.bitmanip : bitfields;

   //    mixin(bitfields!(
   //       uint, "allbut", 1,
   //       uint, "global", 1,
   //       uint, "print", 2,
   //       uint, "inrange", 1,
   //       uint, "", 3
	// 	));
   // }
   {
		uint allbut  : 1;	/* was negation specified? */
		uint global  : 1;	/* was p postfix specified? */
		uint print   : 2;	/* was g postfix specified? */
		uint inrange : 1;	/* in an address range? */
	}
   Flags flags;
   uint nth;			/* sed nth occurance */
}
pragma(msg, cmd_t.sizeof);
static foreach(member; __traits(allMembers, cmd_t)) {
   mixin("pragma(msg, \"offset "~member~" = \", cmd_t." ~ member~".offsetof);");
}
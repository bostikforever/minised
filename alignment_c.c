#include <stdio.h>
typedef struct	cmd_t			/* compiled-command representation */
{
	char	*addr1;			/* first address for command */
	char	*addr2;			/* second address for command */
	union
	{
		char		*lhs;	/* s command lhs */
		struct cmd_t	*link;	/* label link */
	} u;
	char	command;		/* command code */
	char	*rhs;			/* s command replacement string */
	FILE	*fout;	 		/* associated output file descriptor */
	struct
	{
		unsigned allbut  : 1;	/* was negation specified? */
		unsigned global  : 1;	/* was p postfix specified? */
		unsigned print   : 2;	/* was g postfix specified? */
		unsigned inrange : 1;	/* in an address range? */
	} flags;
	unsigned nth;			/* sed nth occurance */
}
sedcmd;		/* use this name for declarations */
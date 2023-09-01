/* sed.h -- types and constants for the stream editor
   Copyright (C) 1995-2003 Eric S. Raymond
   Copyright (C) 2004-2017 Rene Rebe
*/

module sed;

extern(C):
enum TRUE            = 1;
enum FALSE           = 0;
/* data area sizes used by both modules */
enum MAXBUF		= 4000;	/* current line buffer size */
enum MAXAPPENDS	= 20;	/* maximum number of appends */
enum MAXTAGS	= 9;	/* tagged patterns are \1 to \9 */
enum MAXCMDS	= 200;	/* maximum number of compiled commands */
enum MAXLINES	= 256;	/* max # numeric addresses to compile */

/* constants for compiled-command representation */
enum EQCMD	= 0x01;	/* = -- print current line number		*/
enum ACMD	= 0x02;	/* a -- append text after current line 	*/
enum BCMD	= 0x03;	/* b -- branch to label				*/
enum CCMD	= 0x04;	/* c -- change current line 		*/
enum DCMD	= 0x05;	/* d -- delete all of pattern space		*/
enum CDCMD	= 0x06;	/* D -- delete first line of pattern space	*/
enum GCMD	= 0x07;	/* g -- copy hold space to pattern space	*/
enum CGCMD	= 0x08;	/* G -- append hold space to pattern space	*/
enum HCMD	= 0x09;	/* h -- copy pattern space to hold space	*/
enum CHCMD	= 0x0A;	/* H -- append hold space to pattern space	*/
enum ICMD	= 0x0B;	/* i -- insert text before current line 	*/
enum LCMD	= 0x0C;	/* l -- print pattern space in escaped form	*/
enum CLCMD	= 0x20;	/* L -- hexdump					*/
enum NCMD	= 0x0D;	/* n -- get next line into pattern space	*/
enum CNCMD	= 0x0E;	/* N -- append next line to pattern space	*/
enum PCMD	= 0x0F;	/* p -- print pattern space to output		*/
enum CPCMD	= 0x10;	/* P -- print first line of pattern space	*/
enum QCMD	= 0x11;	/* q -- exit the stream editor			*/
enum RCMD	= 0x12;	/* r -- read in a file after current line */
enum SCMD	= 0x13;	/* s -- regular-expression substitute		*/
enum TCMD	= 0x14;	/* t -- branch on last substitute successful	*/
enum CTCMD	= 0x15;	/* T -- branch on last substitute failed	*/
enum WCMD	= 0x16;	/* w -- write pattern space to file		*/
enum CWCMD	= 0x17;	/* W -- write first line of pattern space	*/
enum XCMD	= 0x18;	/* x -- exhange pattern and hold spaces		*/
enum YCMD	= 0x19;	/* y -- transliterate text			*/

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
	char	command = void;		/* command code */
	char	*rhs;			/* s command replacement string */
	import core.stdc.stdio;
	FILE* fout;	 	/* associated output file descriptor */

    private struct Flags
    {
        import std.bitmanip : bitfields;

        mixin(bitfields!(
            uint, "allbut", 1,
            uint, "global", 1,
            uint, "print", 2,
            uint, "inrange", 1,
            uint, "", 3
			));
    }
    Flags flags;
	uint nth;			/* sed nth occurance */
}
alias sedcmd = cmd_t;		/* use this name for declarations */

enum BAD = cast(char *)(-1);	/* guaranteed not a string ptr */

/* address and regular expression compiled-form markers */
enum STAR	= 1;	/* marker for Kleene star */
enum CCHR	= 2;	/* non-newline character to be matched follows */
enum CDOT	= 4;	/* dot wild-card marker */
enum CCL	= 6;	/* character class follows */
enum CNL	= 8;	/* match line start */
enum CDOL	= 10;	/* match line end */
enum CBRA	= 12;	/* tagged pattern start marker */
enum CKET	= 14;	/* tagged pattern end marker */
enum CBACK	= 16;	/* backslash-digit pair marker */
enum CLNUM	= 18;	/* numeric-address index follows */
enum CEND	= 20;	/* symbol for end-of-source */
enum CEOF	= 22;	/* end-of-field mark */

auto bits(B)(B b){ return 1 << (b); }

/* sed.h ends here */

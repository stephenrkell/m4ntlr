`#'include <stdio.h>
`#'include <assert.h>
`#'include <err.h>

`#'include "antlr3.h"
`#'include "antlr3defs.h"
`#'include "antlr_m4_grammar_prefix(CLexer.h)"
`#'include "antlr_m4_grammar_prefix(CParser.h)"

typedef ANTLR3_TOKEN_SOURCE TokenSource;
typedef ANTLR3_COMMON_TOKEN CommonToken;
typedef ANTLR3_INPUT_STREAM ANTLRInputStream;
typedef ANTLR3_COMMON_TOKEN_STREAM CommonTokenStream;
typedef ANTLR3_BASE_TREE Tree; 
typedef ANTLR3_COMMON_TREE CommonTree;

int main(int argc, char **argv)
{
	assert(argc == 2);
	const char *filename = argv[1];

	pANTLR3_INPUT_STREAM in_fileobj = antlr3FileStreamNew((uint8_t *) filename,
		ANTLR3_ENC_UTF8);
	if (!in_fileobj) { warnx("Could not open file ``%s''\n", filename); abort(); }
	antlr_m4_grammar_prefix(CLexer) *lexer = antlr_m4_grammar_prefix(CLexerNew)(in_fileobj);
	CommonTokenStream *tokenStream = antlr3CommonTokenStreamSourceNew(
		ANTLR3_SIZE_HINT, TOKENSOURCE(lexer));
	antlr_m4_grammar_prefix(CParser) *parser = antlr_m4_grammar_prefix(CParserNew)(tokenStream); 
	antlr_m4_grammar_prefix(CParser_)`'antlr_m4_grammar_toplevel`'_return ret = parser->toplevel(parser);
	Tree *tree = ret.tree;
	
	pANTLR3_STRING s = tree->toStringTree(tree);
	
	printf("%s\n", (char*) s->chars);
	/* FIXME: saner way to detect the error node */
	return 0 == strcmp((char*) s->chars, "Tree Error Node");
}	

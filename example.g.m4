include(head.g.m4)

antlr_m4_begin_rules

/* based on the antlr example at http://www.antlr.org/wiki/display/ANTLR3/Example */

prog	: stat+ ;

stat	:	expr NEWLINE        -> expr
	|	ID '=' expr NEWLINE -> ^('=' ID expr)
	|	NEWLINE             ->
	;

expr	:	multExpr (('+'^|'-'^) multExpr)*
	;

multExpr
	:	atom ('*'^ atom)*
	;

atom	:	INT
	|	ID
	|	'('! expr ')'!
	;

ID	:	('a'..'z'|'A'..'Z')+ ;

INT	:	'0'..'9'+ ;

NEWLINE	:	'\r'? '\n' ;

WS	:	(' '|'\t'|'\n'|'\r')+ {antlr_m4_skip_action} ;

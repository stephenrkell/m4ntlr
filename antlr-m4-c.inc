include(antlr-m4.inc)
define(antlr_m4_grammar_name_suffix,C)
define(antlr_m4_language,C)
define(antlr_m4_skip_action,SKIP();)
define(antlr_m4_newline_action,$channel=HIDDEN; $line = $line + 1;)
define(antlr_m4_header,)
define(antlr_m4_extra_options,)
define(antlr_m4_before_lexer_rules,@lexer::includes {
    #define _empty NULL
})

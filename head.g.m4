include(antlr_m4_include_file)
grammar antlr_m4_make_grammar_name(antlr_m4_grammar_name,antlr_m4_grammar_name_suffix);
options {
    language=antlr_m4_language;
    antlr_m4_extra_options
    antlr_m4_user_options
}

// headers are output on `antlr_m4_begin_rules'
// tokens {} goes here!
// then rules!
// remember: 
// use `antlr_m4_begin_rules' before your rules
// use `antlr_m4_before_lexer_rules' before your lexer rules
// use `antlr_m4_newline_action' and `antlr_m4_skip_action' in lexer

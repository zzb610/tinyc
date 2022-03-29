# run: word_spliter 
# 			./word_spliter < word_spliter.l

# word_spliter: lex.yy.c
# 				clang++ -o $@ $<

# lex.yy.c: word_spliter.l
# 				flex $<

out: scanner

scanner: lex.yy.c token.h
				clang++ -o $@ $<

lex.yy.c: scanner.l
				flex $<
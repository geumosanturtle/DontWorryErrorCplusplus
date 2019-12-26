dwecc: lexical.cpp parser.o 
	g++ -std=c++11 lexical.cpp parser.o 
	rm -f lexical.cpp parser.o 

parser.o: parser.h 
	g++ -c -std=c++11 parser.cpp 
	rm parser.cpp parser.h 

lexical.cpp: dwecpp_lex.l
	flex -o lexical.cpp dwecpp_lex.l

parser.h: dwecpp_parser.y
	bison -dy dwecpp_parser.y -o parser.cpp
	mv parser.hpp parser.h

clean:
	rm -rf lexical.cpp parser.cpp parser.h parser.o

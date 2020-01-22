#ifndef _AST_H_
#define _AST_H_

#include <map>
#include <vector>
#include <list>
#include <iostream>
#include <fstream>


template<typeame T>
class ASTNode{
	private:
		ASTNode<T> *bro   = nullptr;
		ASTNode<T> *child = nullptr;
		T key;

	public:
 		ASTNode<T>( const T& _key ):key(_key){}
		ASTNode<T> *getchild() { return this->child; }
		ASTNode<T> *getbro()   { return this->bro  ; }
		const T& getkey() const{ return this->key  ; }
		void setbro(ASTNode<T> *_newbro) { this->bro = _newbro; }
		void setchild(ASTNode<T> *_newchild) { this->child = _newchild; }
		const bool addbro(ASTNode<T> *_newbro) {
			ASTNode<T> *ptr = this->bro;
			while ( ptr != nullptr ) {
				ptr = ptr->bro;
				}
			if (_newbro != nullptr) { 
				ptr = _newbro;
				return true;
			}
			return false;
		}
		const bool addchild(ASTNode<T> *_newchild){
			if ( this->child != nullptr ) return (this->child)->addbro(_newchild);
			else if ( _newchild != nullptr ) { 
				this->child = _newchild;
				return true;
			}
			return false;
		}

};

template<Typename T>
class AST {
	private:
	 ASTNode<T> *root = nullptr;
	public:

};





#endif

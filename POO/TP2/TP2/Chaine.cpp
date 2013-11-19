/**
* \file Chaine.cpp
* \brief Fichier cpp qui d�finit la gestion des chaines de caract�res
* \author Damien Cremilleux, Lauriane Holy
* \date 3/10/2013
*
*/

#include "Chaine.h"
#include <iostream>

/**
* \fn Chaine()
* \brief Constructeur pas d�faut de la classe Chaine
* 
* Initialise un tableau vide
*
* \return Chaine, une chaine de caract�re vide
*/
Chaine::Chaine(){
	_p_chaine = new char[1];
	_p_chaine[0] = '\0';
}	

/**
* \fn Chaine(const char* chaine)
* \brief Constructeur de la classe Chaine � partir d'un tableau
* 
* \param[in] chaine, un pointeur sur un tableau de caract�res
*
* \return Chaine, une chaine de caract�re vide
*/
Chaine::Chaine(const char* chaine){
	// calculate the length of the chaine
	int length = 0;
	const char * p_chaine = chaine; // p_chaine must be const because chaine is const
	while (*p_chaine != '\0') 
	{
		length++;
		p_chaine++;	
	}

	// allocate the chaine 
	_p_chaine = new char[length+1]; //we add 1 to put the \0
	int i = 0;
	while (chaine[i] != '\0') 
	{
		_p_chaine[i] = chaine[i];
		i++;
	}
	_p_chaine[i] = '\0';
}

/**
* \fn Chaine(const Chaine& chaine)
* \brief Constructeur par recopie de la classe Chaine � partir d'une reference
* 
*
* \param[in] chaine, r�ference sur une chaine de caract�res
*
* \return Chaine, une chaine de caract�re vide
*/
Chaine::Chaine(const Chaine& chaine){
	// calculate the length of the chaine
	int length = 0;
	char * p_chaine = chaine._p_chaine;
	while (*p_chaine != '\0') 
	{
		length++;
		p_chaine++;	
	}

	// allocate the chaine 
	_p_chaine = new char[length+1]; //we add 1 to put the \0
	int i = 0;
	while (chaine._p_chaine[i] != '\0') 
	{
		_p_chaine[i] = chaine._p_chaine[i];
		i++;
	}
	_p_chaine[i] = '\0';
}

/**
* \fn ~Chaine()
* \brief Destructeur de la classe Chaine
*/
Chaine::~Chaine(){
	delete [] _p_chaine;
}

/**
* \fn void afficherChaine() const
* \brief affiche la chaine de caract�re appel� par la m�thode
* 
*/
void Chaine::afficherChaine() const {
	char * p_chaine = _p_chaine;
	while (*p_chaine != '\0') 
	{
		cout<<*p_chaine;
		p_chaine++;	
	}
	cout<<"\n";
}

/**
* \fn bool operator== (const Chaine& c) const
* \brief compare l'�galit� entre deux chaine
*
* \param[in] chaine, r�ference sur une chaine de caract�res
*
* \return bool le r�sultat de la comparaison
*/
bool Chaine::operator== (const Chaine& chaine) const{
	bool res = false;
	char * p_chaine2 = chaine._p_chaine;
	char * p_chaine1 = this->_p_chaine;

	while(*p_chaine1==*p_chaine1 && *p_chaine1 != '\0')
	{
		p_chaine1++;
		p_chaine2++;
	}
	if (*p_chaine1==*p_chaine2 && *p_chaine2 == '\0')
		res = true;

	return res;	
}

/**
* \fn bool operator> (const Chaine& c) const
* \brief compare si la chaine pass� en param�tre est inf�rieur � celle sur laquelle la m�thode est appel�
*
* \param[in] chaine, r�ference sur une chaine de caract�res
*
* \return bool le r�sultat de la comparaison
*/
bool Chaine::operator> (const Chaine& chaine) const{
	bool res = false;
	char * p_chaine2 = chaine._p_chaine;
	char * p_chaine1 = this->_p_chaine;

	while(*p_chaine1 == *p_chaine2 && *p_chaine1 != '\0') {
		p_chaine1++;
		p_chaine2++;
	}
	return *p_chaine1 > *p_chaine2;
}

/**
* \fn bool operator< (const Chaine& c) const
* \brief compare si la chaine pass� en param�tre est superieur � celle sur laquelle la m�thode est appel�
*
* \param[in] chaine, r�ference sur une chaine de caract�res
*
* \return bool le r�sultat de la comparaison
*/
bool Chaine::operator< (const Chaine& chaine) const{
	bool res = false;
	char * p_chaine2 = chaine._p_chaine;
	char * p_chaine1 = this->_p_chaine;

	while(*p_chaine1 == *p_chaine2 && *p_chaine1 != '\0') {
		p_chaine1++;
		p_chaine2++;
	}
	return *p_chaine1 < *p_chaine2;
}

/**
* \fn bool operator<= (const Chaine& c) const
* \brief compare si la chaine pass� en param�tre est superieur ou �gale � celle sur laquelle la m�thode est appel�
*
* \param[in] chaine, r�ference sur une chaine de caract�res
*
* \return bool le r�sultat de la comparaison
*/
bool Chaine::operator<= (const Chaine& chaine) const{
	return chaine > *this;
}
/**
* \fn bool operator>= (const Chaine& c) const
* \brief compare si la chaine pass� en param�tre est inf�rieur ou �gale � celle sur laquelle la m�thode est appel�
*
* \param[in] chaine, r�ference sur une chaine de caract�res
*
* \return bool le r�sultat de la comparaison
*/

bool Chaine::operator>= (const Chaine& chaine) const{
	return chaine < *this;
}

/**
* \fn bool operator+ (const Chaine& c) const
* \brief concat�nation de la chaine pass�e en param�tre et de la chaine pass� en argument implicite
*
* \param[in] chaine, r�ference sur une chaine de caract�res
*
* \return chaine, la nouvelle chaine issu de la concatenation
*/
Chaine Chaine::operator+ (const Chaine& chaine) const{
	char * p_chaine2 = chaine._p_chaine;
	char * p_chaine1 = this->_p_chaine;

	// calculate the lenght of the first chaine
	int length = 0;
	char * p_chaine = chaine._p_chaine;
	while (*p_chaine != '\0') 
	{
		length++;
		p_chaine++;	
	}

	// calculate the lenght of the second chaine and added the result to the variable
	p_chaine = this->_p_chaine;
	while (*p_chaine != '\0') 
	{
		length++;
		p_chaine++;	
	}

	// allocate the chaine 
	char* _chaine_result = new char[length+1]; //we add 1 to put the \0
	int i = 0;
	int j = 0;

	// add the first chaine to the result
	while (p_chaine1[i] != '\0') 
	{
		_chaine_result[i] = p_chaine1[i];
		i++;
	}

	// add the second chaine to the result
	while (p_chaine2[j] != '\0') 
	{
		_chaine_result[i] = p_chaine2[j];
		j++;
		i++;
	}
	_chaine_result[i] = '\0';

	Chaine result(_chaine_result);

	return result;
}

/**
* \fn bool operator+= (const Chaine& c) const
* \brief concat�nation de la chaine pass�e en param�tre et de la chaine pass� en argument implicite, la concat�nation se fait sur cette derni�re
*
* \param[in] chaine, r�ference sur une chaine de caract�res
*
* \return chaine, la chaine appelante suite � la concatenation
*/
Chaine& Chaine::operator+= (const Chaine& chaine){
	int i;

	char * p_chaine2 = chaine._p_chaine;
	char * p_chaine1 = this->_p_chaine;

	// calculate the lenght of the first chaine
	int length1 = 0;
	char * p_chaine = this->_p_chaine;
	while (*p_chaine != '\0') 
	{
		length1++;
		p_chaine++;	
	}

	// calculate the second of the first chaine
	int length2 = 0;
	p_chaine = chaine._p_chaine;
	while (*p_chaine != '\0') 
	{
		length2++;
		p_chaine++;	
	}

	this->_p_chaine = (char*) realloc (this->_p_chaine, length1+length2+1);

	p_chaine = chaine._p_chaine;	
	for(i =length1; i<length1+length2; i++)
	{
		this->_p_chaine[i] = *p_chaine;
		p_chaine++;
	}

	this->_p_chaine[length1+length2] = '\0';
	return *this;
}

/**
* \fn char index_char(int ind)
* \brief renvoi le caract�re � l'indexe donn� en param�tre
*
* \param[in] ind, l'indexe du caract�re � renvoyer
*
* \return char, le caract�re de la chaine a l'indexe ind
*/
int Chaine::index_char(const char c){
	char * p_chaine = this->_p_chaine;
	int i=0;

	while (*p_chaine != '\0' && *p_chaine != c ) 
	{
		i++;
		p_chaine++;	
	}
	if(*p_chaine == c)
		return i+1;
	else
		return -1;
}

/**
* \fn Chaine sous_chaine(char deb, char fin)
* \brief extrait la sous-chaine commen�ant par le caract�re deb et se terminant par fin
*
* \param[in] char deb, le premier caract�re de la sous-chaine � extraire
* \param[in] char fin, le dernier caract�re de la sous-chaine � extraire
*
* \return chaine, la sous chaine (deb ... fin) extraite
*/
/*
Chaine Chaine::sous_chaine(char deb, char fin){

// TODO : chercher les indexes des caract�res .. comment appeler une m�thode sur l'objet appelant 

int ind1;
int ind2;
ind1= this.index_char(deb);
ind2= this->index_char(fin);

}
*/

/**
* \fn Chaine sous_chaine(int ins1, int ind2)
* \brief extrait la sous-chaine commen�ant � la position ind1 et se terminant � ind2
*
* \param[in] char ind1, la position du premier caract�re de la sous-chaine � extraire
* \param[in] char ind2, la position du dernier caract�re de la sous-chaine � extraire
*
* \return chaine, la sous chaine extraite
*/
Chaine Chaine::sous_chaine(int ind1, int ind2){
	char * p_chaine = this->_p_chaine;
	int i=0;
	int j=ind1;
	// allocate the chaine
	char* _chaine_result = new char[ind2-ind1+1+1]; //we add 1 because the index start to 0 and we add 1 to put the \0

	for(j=ind1; j<=ind2 ; j++){
		_chaine_result[i] = p_chaine[j];
		i++;
	}

	_chaine_result[ind2-ind1+1] = '\0';

	Chaine resul(_chaine_result);
	return resul;
}

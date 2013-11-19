/**
* \file Chaine.h
* \brief Fichier d'en-tete pour la gestion des chaines de caract�res
* \author Damien Cremilleux, Lauriane Holy
* \date 3/10/2013
*
*/

#ifndef CHAINE_H
#define CHAINE_H

using namespace std;

/**
* \class Chaine
* \brief classe chaine, represenation des chaines de caract�res
*/
class Chaine{

private:
	/*!< La chaine de de caract�re est stock�e dans un tableau*/
	char * _p_chaine;

public :
	/**
	* \fn Chaine()
	* \ Constructeur pas d�faut de la classe Chaine
	* 
	* Initialise un tableau vide
	*
	* \return Chaine, une chaine de caract�re vide
	*/
	Chaine();

	/**
	* \fn Chaine(const char* chaine)
	* \ Constructeur de la classe Chaine � partir d'un tableau
	* 
	* \param[in] chaine, un pointeur sur un tableau de caract�res
	*
	* \return Chaine, une chaine de caract�re vide
	*/
	Chaine(const char* chaine);

	/**
	* \fn Chaine(const Chaine& chaine)
	* \ Constructeur par recopie de la classe Chaine � partir d'une reference
	* 
	*
	* \param[in] chaine, r�ference sur une chaine de caract�res
	*
	* \return Chaine, une chaine de caract�re vide
	*/
	Chaine(const Chaine& chaine);

	/**
	* \fn ~Chaine()
	* \ Destructeur de la classe Chaine
	*/
	~Chaine();

	/**
	* \fn void afficherChaine() const
	* \brief affiche la chaine de caract�re appel� par la m�thode
	* 
	*/
	void afficherChaine() const;

	/**
	* \fn bool operator== (const Chaine& c) const
	* \  par recopie de la classe Chaine � partir d'une reference
	* 
	*
	* \param[in] chaine, r�ference sur une chaine de caract�res
	*
	* \return Chaine, une chaine de caract�re vide
	*/
	bool operator== (const Chaine& chaine) const;

	/**
	* \fn bool operator> (const Chaine& c) const
	* \brief compare si la chaine pass� en param�tre est inf�rieur � celle sur laquelle la m�thode est appel�
	*
	* \param[in] chaine, r�ference sur une chaine de caract�res
	*
	* \return bool le r�sultat de la comparaison
	*/
	bool operator> (const Chaine& chaine) const;

	/**
	* \fn bool operator< (const Chaine& c) const
	* \brief compare si la chaine pass� en param�tre est superieur � celle sur laquelle la m�thode est appel�
	*
	* \param[in] chaine, r�ference sur une chaine de caract�res
	*
	* \return bool le r�sultat de la comparaison
	*/
	bool operator< (const Chaine& chaine) const;

	/**
	* \fn bool operator>= (const Chaine& c) const
	* \brief compare si la chaine pass� en param�tre est inf�rieur ou �gale � celle sur laquelle la m�thode est appel�
	*
	* \param[in] chaine, r�ference sur une chaine de caract�res
	*
	* \return bool le r�sultat de la comparaison
	*/
	bool operator>= (const Chaine& chaine) const;

	/**
	* \fn bool operator<= (const Chaine& c) const
	* \brief compare si la chaine pass� en param�tre est superieur ou �gale � celle sur laquelle la m�thode est appel�
	*
	* \param[in] chaine, r�ference sur une chaine de caract�res
	*
	* \return bool le r�sultat de la comparaison
	*/
	bool operator<= (const Chaine& chaine) const;

	/**
	* \fn bool operator+ (const Chaine& c) const
	* \brief concat�nation de la chaine pass�e en param�tre et de la chaine pass� en argument implicite
	*
	* \param[in] chaine, r�ference sur une chaine de caract�res
	*
	* \return chaine, la nouvelle chaine issu de la concatenation
	*/
	Chaine operator+ (const Chaine& chaine) const;

	/**
	* \fn bool operator+= (const Chaine& c) const
	* \brief concat�nation de la chaine pass�e en param�tre et de la chaine pass� en argument implicite, la concat�nation se fait sur cette derni�re
	*
	* \param[in] chaine, r�ference sur une chaine de caract�res
	*
	* \return chaine, la chaine appelante suite � la concatenation
	*/
	Chaine& operator+= (const Chaine& chaine);

	/**
	* \fn char index_char(int ind)
	* \brief renvoi le caract�re � l'indexe donn� en param�tre
	*
	* \param[in] ind, l'indexe du caract�re � renvoyer
	*
	* \return char, le caract�re de la chaine a l'indexe ind
	*/
	int index_char(const char c);

	/**
	* \fn Chaine sous_chaine(char deb, char fin)
	* \brief extrait la sous-chaine commen�ant par le caract�re deb et se terminant par fin
	*
	* \param[in] char deb, le premier caract�re de la sous-chaine � extraire
	* \param[in] char fin, le dernier caract�re de la sous-chaine � extraire
	*
	* \return chaine, la sous chaine (deb ... fin) extraite
	*/
	Chaine sous_chaine(char deb, char fin);

	/**
	* \fn Chaine sous_chaine(int ins1, int ind2)
	* \brief extrait la sous-chaine commen�ant � la position ind1 et se terminant � ind2
	*
	* \param[in] char ind1, la position du premier caract�re de la sous-chaine � extraire
	* \param[in] char ind2, la position du dernier caract�re de la sous-chaine � extraire
	*
	* \return chaine, la sous chaine extraite
	*/
	Chaine sous_chaine(int ind1, int ind2);

};

#endif
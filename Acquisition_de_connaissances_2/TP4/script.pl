#!/usr/bin/perl -w

## CREMILLEUX 
## HOLY

use strict;
use locale;
binmode(STDOUT,':utf8'); # si le terminal est en utf8
binmode(STDERR,':utf8'); # si le terminal est en utf8


open(ARTICLE,"articles.10p.txt") || die ("Erreur d'ouverture de ARTICLE") ;
open(MOTS,"mots.lst") || die ("Erreur d'ouverture de MOTS") ;
open(RESULTAT_TEMP,"+> resultat_temp.csv") || die ("Erreur d'écriture de RESULTAT");
open(RESULTAT,"+> resultat.csv") || die ("Erreur d'écriture de RESULTAT");

# On crée l'entête pour les attributs
my ($mot, $ligne, @liste_mots);

while($mot = <MOTS>)
{	
    chomp $mot;
    print RESULTAT_TEMP "$mot,";
}

print RESULTAT "\n";
# On récupère le tableau d'attribut
seek(RESULTAT_TEMP,0,0);
while($mot = <RESULTAT_TEMP>)
{	
    @liste_mots = split( /,/, $mot );
}


#On regarde pour chaque mot sa présence dans les articles
while($ligne = <ARTICLE>)
{
    foreach $mot (@liste_mots){
	if( $ligne =~ m/$mot/ ) {
	    print RESULTAT_TEMP "true,";
	}
	else {
	    print RESULTAT_TEMP "false,";
	}
    }
    print RESULTAT_TEMP "\n";
}

seek(RESULTAT_TEMP,0,0);
while($mot = <RESULTAT_TEMP>)
{	
    chomp $mot;
    chop $mot;
    print RESULTAT $mot;
    print RESULTAT "\n";
}

close(MOTS);
close(ARTICLE);
close(RESULTAT);
close(RESULTAT_TEMP);

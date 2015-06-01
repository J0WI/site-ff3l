#!/bin/sh
# 
###############################################################################################
# Buildscript zu erstellung der Images
# 
# Dieses Skript bereitet das Arbeitsverzeichnis vor und erstellt die Images für ein Gluon-Target.
# Die Konfiguration muss vorher mit prepare.sh vorbereitet werden. 
#
# Das Script benötigt die folgenden Kommandozeilenparameter:
# - Gluon-Commit (z.B. v2014.4)
# - Build-Nummer (z.B. 114)
# - Gluon-target (z.B. ar71xx-generic)
# - Optionale Parameter für make (z.B. V=s oder -j 4)
#
###############################################################################################

# Bei Ausführung auf dem Buildserver ist die Variable $WORKSPACE gesetzt 
# andernfalls wird das aktuelle Verzeichnis verwendet  

if [ "x$WORKSPACE" = "x" ]; then
	WORKSPACE=`pwd`
fi

# Build ausführen 
# Optional kann hier mit GLUON_TARGET=x86-generic auch ein anderes Target erstellt werden 
# Optional kann mit BROKEN=1 das Erstellen experimenteller Images ergänzt werden
cd $WORKSPACE/gluon-$1
make update GLUON_RELEASE=$1+$2 GLUON_TARGET=$3 $5 $6 $7 $8 $9
make clean GLUON_RELEASE=$1+$2 GLUON_TARGET=$3 $5 $6 $7 $8 $9

make GLUON_RELEASE=$1+$2 GLUON_TARGET=$3 GLUON_BRANCH=$4 $5 $6 $7 $8 $9
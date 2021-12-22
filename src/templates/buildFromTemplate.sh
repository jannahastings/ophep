#!/bin/bash
#

curl -L http://purl.obolibrary.org/obo/MFOMD.owl --output MFOMD.owl
curl -L http://purl.obolibrary.org/obo/MF.owl --output MF.owl

robot merge --input MF.owl --input MFOMD.owl --output imports.owl


robot template --input imports.owl  --prefix "OPHEP: http://purl.obolibrary.org/obo/OPHEP_" --ontology-iri "http://purl.obolibrary.org/obo/OPHEP/ophep-template.owl" --template ophep.csv --output ophep-template.owl

rm MFOMD.owl
rm MF.owl
rm imports.owl 

mv ophep-template.owl ../ontology/

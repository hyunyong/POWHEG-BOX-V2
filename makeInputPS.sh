#!/bin/bash
cat dijet_CT10_8TeV.input | sed "s/renscfact  1d0.*/#renscfact/ ; s/facscfact  1d0.*/#facscfact/; s/storeinfo_rwgt 1/compute_rwgt 1/;" > powheg.input-PS-save

for i in {1..6}
do

case $i in
1) renfac=0.5; facfac=0.5  ;;
2) renfac=0.5; facfac=1    ;;
3) renfac=1  ; facfac=0.5  ;;
4) renfac=1  ; facfac=2    ;;
5) renfac=2  ; facfac=1    ;;
6) renfac=2  ; facfac=2    ;;
esac

cat powheg.input-PS-save | sed "s/#renscfact.*/renscfact $renfac/ ; s/#facscfact.*/facscfact $facfac/ ; " > powhegCase$i.input

done

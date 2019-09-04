#!/bin/bash
cat dijet_CT10_8TeV.input | sed "s/lhans1  11000.*/#lhans1/ ; s/lhans2  11000.*/#lhans2/; s/storeinfo_rwgt 1/compute_rwgt 1/;" > powheg.input-PDF-save

for i in {1..53}
do
let PDFN=11000+i
cat powheg.input-PDF-save | sed "s/#lhans1.*/lhans1 $PDFN/ ; s/#lhans2.*/lhans2 $PDFN/ ; " > powheg8TeVPDF$i.input

done

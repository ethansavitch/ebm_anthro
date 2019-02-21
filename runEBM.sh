#!/bin/csh
# Runscript for Stochastic EBM (14 Feb 2014 JDH)
#---------------------------------------------------------------------------------------------------
#set echo

set wdir 	= /gpfs/fsl/home/esavitch/Desktop/ebm_anthro
set modeldir 	= $wdir/model
set plotdir 	= $wdir/plots
set outdir	= $modeldir/out
set outfile	= $outdir/model.out
set namelist    = input.nml
set sep         = "----------------------------------------"

#---------------------------------------------------------------------------------------------------

cp $wdir/$namelist $modeldir
cd $modeldir

echo null > \(
echo null > AS_NEEDED

make -f Makefile

#---------------------------------------------------------------------------------------------------

echo $sep
./driver

head -n 12 $outfile && tail -n 30 $outfile | head -n 5
head -n 33 $outfile | tail -n 18 > $outdir/zonal.out
tail -n 18 $outfile > $outdir/geog.out


#---------------------------------------------------------------------------------------------------
## postprocessing with NCL
#
#echo $sep
#cd $plotdir
#
#ncl plotZonal.ncl
#ncl plotTempSeries.ncl
#ncl plotPowerSpectrum.ncl

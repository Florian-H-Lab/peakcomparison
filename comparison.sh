#!/bin/bash

OPTIONS="-wa -s -u"

## INPUT
PEAKACHU="../peaks.gtf"
PURECLIP="../peaks.bed"
PIRANHA="../peaks.bed"

## OUTPUT
OUT="../peakcomparison/"
LOG=$OUT"stats.txt"

## RUN
bedtools intersect -a $PEAKACHU -b $PURECLIP $OPTIONS > $OUT"peakachu_pureclip_peaks.bed"
bedtools intersect -a $PEAKACHU -b $PIRANHA $OPTIONS > $OUT"peakachu_piranha_peaks.bed"
bedtools intersect -a $PIRANHA -b $PURECLIP $OPTIONS > $OUT"piranha_pureclip_peaks.bed"
bedtools intersect -a $OUT"peakachu_piranha_peaks.bed" -b $PURECLIP $OPTIONS > $OUT"peakachu_piranha_pureclip_peaks.bed"

## STATS
echo -n -e "peakcaller \t peakcount\n" > $LOG
echo "PEAKachu	" $(cat $PEAKACHU | wc -l) >> $LOG
echo "Piranha	" $(cat $PIRANHA | wc -l) >> $LOG
echo "PureCLIP	" $(cat $PURECLIP | wc -l) >> $LOG
echo "PEAKachu_PureCLIP	" $(cat $OUT"peakachu_pureclip_peaks.bed" | wc -l) >> $LOG
echo "Piranha_PureCLIP	" $(cat $OUT"piranha_pureclip_peaks.bed" | wc -l) >> $LOG
echo "PEAKachu_Piranha	" $(cat $OUT"peakachu_piranha_peaks.bed" | wc -l) >> $LOG
echo "ALL	" $(cat $OUT"peakachu_piranha_pureclip_peaks.bed" | wc -l) >> $LOG

#include <R.h>
#include <stdio.h>
#include <time.h>
#include <math.h>
#include <stdlib.h>

void ucov(double *Xp, double *Yp, int *NR,int *NCX, int *NCY, double *S1, double *S2){  /*NR =nrow, *NC=ncol*/
   int i,ii,j,jj,k,l, m, n;
   double *temp1 = (double *)malloc(sizeof(double));
   double *temp2 = (double *)malloc(sizeof(double));
m = *NCX - 1;
n = *NCY - 1;
 for(l=0;l<*NR; l=l+1){
 for(k=0;k<*NR; k=k+1){
      *temp1 = 0;*temp2 = 0;
for(i = 0; i < *NCX;i = i + 1){
 for(j = 0; j < n;j = j +1 ) {for(jj = j+1; jj < *NCY;jj = jj + 1) 
 *temp1 = *temp1 +(Xp[k + i*(*NCX)] -Yp[k + j*(*NCY)])*(Xp[l + i *(*NCX)] - Yp[l + jj*(*NCY)]);}
         }
 for(j = 0;j < *NCY;j = j + 1){ for(i = 0; i < m;i = i + 1){ 
 for(ii = i + 1;ii < *NCX;ii = ii + 1) 
 *temp2 = *temp2 +(Xp[k + i*(*NCX)] - Yp[k + j*(*NCY)])*(Xp[l + ii*(*NCX)] - Yp[l + j*(*NCY)]);
         }
      S1[k + l*(*NR)] = *temp1;S2[k + l*(*NR)] = *temp2;
}}}
free(temp1);free(temp2);
}

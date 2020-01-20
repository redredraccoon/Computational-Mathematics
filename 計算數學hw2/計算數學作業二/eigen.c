/*--------------------------------------------------------------------------*/
/*  11/15/2005 eigen.c                                                      */
/*             Computing eigenvalues/eigenvectors by Givens rotations       */
/*  [Usage]  a.out datah2T.txt > h2key.txt                                  */
/*--------------------------------------------------------------------------*/
#include <stdio.h>
#include <string.h>
#include <math.h>

main(int argc, char *argv[])
{  FILE  *fin;
   unsigned char  ch;
   int   i,j,k,n, Nrun;
   float **A, **V, t, S[5][5];
   double tol;
   void  Givens();

   fin=fopen(argv[1],"r");

   fscanf(fin,"%c",&ch);  while(ch != '\n') fscanf(fin,"%c",&ch);
   fscanf(fin,"%d",&n);

   A=(float **) malloc(n*n*sizeof(float *));
   if (A==NULL) return(NULL); 
   for (i=0; i<n; i++) {
     A[i]=(float *) malloc(n*sizeof(float));
     if (A[i]==NULL) return(NULL); 
   }
   V=(float **) malloc(n*n*sizeof(float *));
   if (V==NULL) return(NULL); 
   for (i=0; i<n; i++) {
     V[i]=(float *) malloc(n*sizeof(float));
     if (V[i]==NULL) return(NULL); 
   }

/*--------------------------------------------------------------------------*/
/*  Read the input symmetric matrix A                                       */
/*--------------------------------------------------------------------------*/
   for (i=0; i<n; i++)
     for (j=0; j<n; j++) {
       fscanf(fin,"%f",&t);  A[i][j]=t; S[i][j]=t;
   }

   Nrun=31;
   tol=1.0E-22;
   Givens(n,A,V,Nrun,tol);

   printf("Eigenvalues: \n");
   for (i=0; i<n; i++)  printf("%9.4f", A[i][i]);  printf("\n");
   printf("\n");
   printf("Eigenvectors (in columns):\n");
   for (i=0; i<n; i++) {
     for (j=0; j<n; j++) printf("%9.4f",V[i][j]);
     printf("\n");
   } printf("\n");
}








/*--------------------------------------------------------------------------*/
/* Apply Givens rotations to compute eigenvalues of a real symmetric matrix */
/*--------------------------------------------------------------------------*/
void Givens(int n, float **A, float **V, int Nrun, double tol)
{ int i,j,k, p,q,r;
  float c,s,t,tau, tmax, alpha, xp,xq, eps=1.0E-22;
  double sum;

  for (i=0; i<n; i++)
    for (j=0; j<n; j++)
      if (i==j) V[i][j]=1.0;  else V[i][j]=0.0;

  for (k=0; k<Nrun; k++) {
    tmax=-1; 
    sum=0.0;
    for (i=0; i<n; i++)
      for (j=i+1; j<n; j++) {
        t=fabs(A[i][j]);
        sum+=(t*t);
        if (t > tmax) {tmax=t; p=i; q=j;}
    }
    sum=sqrt(2.0*sum);
    if (sum < tol)  return;
    alpha=(A[q][q]-A[p][p])/2.0/A[p][q]; 
    t=((alpha>eps)? 1.0/(alpha+sqrt(1.0+alpha*alpha)) : 
       (alpha<eps)? 1.0/(alpha-sqrt(1.0+alpha*alpha)) : 1.0);

    c=1.0/sqrt(1.0+t*t);
    s=c*t;
    tau=s/(1.0+c);

/*--------------------------------------------------------------------------*/
/*  A^(k+1)  \leftarrow J_k^t A^k J_k                                       */
/*--------------------------------------------------------------------------*/
    for (r=0; r<p; r++)     A[p][r]=c*A[r][p]-s*A[r][q];
    for (r=p+1; r<n; r++)   if (r!=q) A[r][p]=c*A[p][r]-s*A[q][r];

    for (r=0; r<p; r++)     A[q][r]=s*A[r][p]+c*A[r][q];
    for (r=p+1; r<q; r++)   A[q][r]=s*A[p][r]+c*A[r][q];
    for (r=q+1; r<n; r++)   A[r][q]=s*A[p][r]+c*A[q][r];

    A[p][p]=A[p][p]-t*A[p][q];
    A[q][q]=A[q][q]+t*A[p][q];
    A[q][p]=0.0;

    for (i=0; i<n; i++)
      for (j=i+1; j<n; j++)
        A[i][j]=A[j][i];
/*--------------------------------------------------------------------------*/
/* Eigenvectors are stored in the columns of V                              */
/*--------------------------------------------------------------------------*/
    for (i=0; i<n; i++) {
      xp=V[i][p];
      xq=V[i][q];
      V[i][p]=c*xp-s*xq;
      V[i][q]=s*xp+c*xq;
    }
  }
}





/*
Toeplitz Matrix / Tridiagonal Matrix 
  5
  1.0000  0.5000  0.2500  0.1250  0.0625 
  0.5000  1.0000  0.5000  0.2500  0.1250
  0.2500  0.5000  1.0000  0.5000  0.2500
  0.1250  0.2500  0.5000  1.0000  0.5000
  0.0625  0.1250  0.2500  0.5000  1.0000
  5
  4  1  0  0  0
  1  4  1  0  0
  0  1  4  1  0
  0  0  1  4  1
  0  0  0  1  4

Eigenvalues: 
   2.2619   0.4572   0.6903   1.2303   0.3602

Eigenvectors:
   0.3605  -0.4352  -0.5611  -0.5573   0.2348
   0.4820   0.5573   0.0970  -0.4352  -0.5082
   0.5248  -0.0000   0.5929  -0.0000   0.6108
   0.4820  -0.5573   0.0970   0.4352  -0.5082
   0.3605   0.4352  -0.5611   0.5573   0.2349
*/

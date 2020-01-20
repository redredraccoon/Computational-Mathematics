  d=10;  n=48;
  fin=fopen('53stdL3.txt');
  fgetl(fin);   fgetl(fin);   fgetl(fin);   %skip 3 lines
  A=fscanf(fin,'%f', [d+1, n]);
  A=A';    X=A(:,1:d);
  Y=pdist(X,'euclid');
  Z=linkage(Y,'complete');
  dendrogram(Z,n);
  title('dendrogram for 53stdL3 data')

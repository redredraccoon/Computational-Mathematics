%
% Script file: mhdist.m
% Squared Mahalanobis distance 
%         between vectors t and mu, w.r.t. matrix S
%
function y=mhdist(t,mu,S)
[n,n]=size(S);
format long;
% S=S+eps;
S=S+0.000001*eye(n);
r2=(t-mu)'*inv(S)*(t-mu);
y=r2;
#ifndef MOD_H
#define MOD_H

double pi_ = 4;

double pi(){ //this is nesecary because Haskell only beleives in functions and can't import a double
  return pi_;
};

int SayHi(){
  printf("HI\n");
  return 1;
};

int BadSayHi(){
  printf("Hello!\n"); // oh no! that should have been Hi
  return -1; //better throw an error
};

int ruinPi(){
  pi_ = 5;
  return 1;
};













#endif

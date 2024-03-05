
String seed="52";
int nb_fois=10;
char[] suite_de_conway;
void print_(char[] n) {
  for (int i=0; i<n.length; i++) {
    print(n[i]);
  }
  println();
}
void transformation() {
  char[] new_=new char[suite_de_conway.length*2];
  char souvenir=suite_de_conway[0];
  int nb=1;
  int index=0;
  int index_=2;
  for (int i=1; i<suite_de_conway.length; i++) {
    if (souvenir==suite_de_conway[i]) {
      nb+=1;
    } else {
      if (nb==1) {
        new_[index]='1';
      } else if (nb==2) {
        new_[index]='2';
      } else {
        new_[index]='3';
      }
      index+=1;
      new_[index]=souvenir;
      index+=1;
      souvenir=suite_de_conway[i];
      nb=1;
      index_+=2;
    }
  }
  if (nb==1) {
    new_[index]='1';
  } else if (nb==2) {
    new_[index]='2';
  } else {
    new_[index]='3';
  }
  index+=1;
  new_[index]=souvenir;
  index+=1;
  suite_de_conway= new char[index_];
  for (int i=0; i<index_; i++) {
    suite_de_conway[i]=new_[i];
  }
}
void setup() {
  frameRate(10);
  boolean test=seed.length()!=0;
  for (int i=0; i<seed.length(); i++) {
    if (!(int(seed.charAt(i))<58 & int(seed.charAt(i))>47)) {
      test=false;
      break;
    }
  }

  suite_de_conway=new char[test?seed.length():1];
  if (test) {
    for (int i=0; i<seed.length(); i++) {
      suite_de_conway[i]=seed.charAt(i);
    }
  } else {
    suite_de_conway[0]='1';
  }
  print_(suite_de_conway);
  for (int i=0; i<(nb_fois<0?10:nb_fois); i++) {
    transformation();
    print_(suite_de_conway);
  }
  exit();
}

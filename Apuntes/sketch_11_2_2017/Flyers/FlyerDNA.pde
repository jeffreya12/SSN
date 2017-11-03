class FlyerDNA {
  
ArrayList<Integer> flappings;
  
  FlyerDNA(ArrayList<Integer> flappings){
    this.flappings = flappings;
  }
  
  int getLength(){
    return flappings.size();
  }
  
  int getFlapping(int pos){
    return flappings.get(pos);
  }
  
}
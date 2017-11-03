class FlyerDNAFactory{
  int minFlappings;
  int maxFlappings;
  int maxFrameValue;
  float mutationRate;
  
  FlyerDNAFactory(int minFlap, int maxFlap, int maxFrame, float mutationRate){
    this.minFlappings = minFlap;
    this.maxFlappings = maxFlap;
    this.maxFrameValue = maxFrame;
    this.mutationRate = mutationRate;
  }
  
  FlyerDNA randomDNA(){
    int flapQuantity = (int) random(minFlappings,maxFlappings);
    ArrayList<Integer> flappings = new ArrayList();
    for(int i = 0; i < flapQuantity; i++){
      flappings.add((int) random(maxFrameValue));
    }
    return new FlyerDNA(flappings);
  }
  
  FlyerDNA combine(FlyerDNA parent1, FlyerDNA parent2){
    float percent = random(1);
    int pos1 = (int)(parent1.getLength() * percent);
    int pos2 = (int)(parent2.getLength() * percent);
    ArrayList<Integer> newDNA = new ArrayList();
    for(int i = 0; i < pos1; i++){
      int flap = parent1.getFlapping(i);
      newDNA.add(mutate(flap));
    }
    for(int i = pos2; i < parent2.getLength(); i++){
      int flap = parent2.getFlapping(i);
      newDNA.add(mutate(flap));
    }
    return new FlyerDNA(newDNA);
  }
  
  int mutate(int value){
    if(random(1) < mutationRate){
      return (int) random(maxFrameValue);
    }
    else{
      return value;
    }
  }
  
}
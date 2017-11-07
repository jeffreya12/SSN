class Selection {
  Flock flock;
  FlyerDNAFactory factory;

  Selection(Flock flock){
    this.flock = flock;
    factory = new FlyerDNAFactory(MIN_FLAPPINGS,MAX_FLAPPINGS,MAX_FRAME_VALUE,MUTATION_RATE);
  }

  ArrayList<Flyer> firstGeneration(int size){
    ArrayList<Flyer> first = new ArrayList();
    for(int i = 0; i < size; i++){
      FlyerDNA dna = factory.randomDNA();
      first.add(new Flyer(flock.origin.x,flock.origin.y,dna));
    }
    return first;
  }

  ArrayList<Flyer> nextGeneration(){
    ArrayList<Flyer> next = new ArrayList();
    while(next.size()< FLOCK_SIZE){
      FlyerDNA parent1 = select();
      FlyerDNA parent2 = select();
      FlyerDNA child = factory.combine(parent1, parent2);
      next.add(new Flyer(flock.origin.x,flock.origin.y,child));
    }
    return next;
  }

  FlyerDNA select(){
    while(true){
      Flyer selected = flock.getFlyer((int)random(flock.getSize()));
      float r = random(1);
      if(r  < fitness(selected)){
        return selected.dna;
      }
    }
  }

  float fitness(Flyer f){
    PVector dif = PVector.sub(flock.target,f.pos);
    float dist = dif.mag();
    return map(dist,0,width/2,1,0);
  }
}

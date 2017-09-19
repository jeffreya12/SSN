import controlP5.*;

ArrayList<ParticleSystem> systems;
PVector gravity;
float g = 0.15;
ArrayList<Particle> fixedParticles = new ArrayList();
float particlesFrecuency;
float k;

ControlP5 cp5;

void setup(){
  size(800, 600, P3D);
  //fullScreen(P3D);
  background(0);
  systems = new ArrayList();
  gravity = new PVector(0, g);
  particlesFrecuency = 5.0;
  //println(particlesFrecuency);
  k = 0.01;

  for (int i = 0; i < 20; i++){
    if(random(100) < 50){
      fixedParticles.add(new AttractionParticle(random(width), random(height), random(1, 10), 0.01));
    } else {
      fixedParticles.add(new RepulsionParticle(random(width), random(height), random(1, 10), 0.01));
    }
  }

  // initControls();

}

void draw(){
  fill(0, 25);
	rect(0, 0, width, height);

  for (Particle fp : fixedParticles){
    fp.draw();
  }

  for (ParticleSystem s : systems){
    s.applyForce(gravity);
    for(IAgent a : s.agents){
      if(a instanceof Particle){
        for(Particle fp : fixedParticles){
          if(fp instanceof AttractionParticle){
            AttractionParticle ap = (AttractionParticle) fp;
            ap.update((Particle) a);
          } else {
            RepulsionParticle rp = (RepulsionParticle) fp;
            rp.update((Particle) a);
          }
        }
      }
    }
    s.update();
    s.draw();
    if((int)(frameCount % particlesFrecuency) == 0){
      s.addParticle();
    }
  }

  //println(particlesFrecuency);
}

void mousePressed( ) {
  systems.add(new ParticleSystem(mouseX, mouseY, k));
}

// void initControls(){
// 	cp5 = new ControlP5(this);
//
//   cp5.addSlider("setG")
// 		.setPosition(10, 130)
// 		.setSize(300, 20)
// 		.setRange(0, 1)
// 		.setValue(g)
// 		.setCaptionLabel("Gravity");
//
//   cp5.addSlider("setK")
//     .setPosition(10, 100)
//     .setSize(300, 20)
//     .setRange(0, 1)
//     .setValue(k)
//     .setCaptionLabel("Spring strenght");
//
//   cp5.addSlider("setFrecuency")
//     .setPosition(10, 70)
//     .setSize(300, 20)
//     .setRange(10, 60)
//     .setValue(particlesFrecuency)
//     .setCaptionLabel("Frecuency of birth");
// }
//
// void setG(float value){
//   g = value;
// 	gravity.set(0, g);
// }
//
// void setK(float value){
//   k = value;
// 	for(ParticleSystem s : systems){
// 		for(IAgent a : s.agents){
//       if (a instanceof Spring){
//           Spring sp = (Spring) a;
//           sp.k = value;
//       }
// 		}
// 	}
// }
//
// void setFrecuency(float value){
//   particlesFrecuency = value;
// }

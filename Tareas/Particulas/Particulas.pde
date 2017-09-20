import controlP5.*;

ArrayList<ParticleSystem> systems;
PVector gravity;
float fg = 0.15;
ArrayList<Particle> fixedParticles = new ArrayList();
float particlesFrecuency = 5;
float k = 0.01;
float restLength = 10;
float friction = 0.01;

ControlP5 cp5;

void setup(){
  size(800, 600, P3D);
  background(0);

  systems = new ArrayList();
  gravity = new PVector(0, fg);

  for (int i = 0; i < 20; i++){
    if(random(100) < 50){
      fixedParticles.add(new AttractionParticle(random(width), random(height), random(1, 10), 0.01));
    } else {
      fixedParticles.add(new RepulsionParticle(random(width), random(height), random(1, 10), 0.01));
    }
  }

  initControls();

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
}

void mousePressed( ) {
  if (mouseButton == RIGHT){
    systems.add(new ParticleSystem(mouseX, mouseY, k, friction, restLength));
  }
}

void initControls(){
	cp5 = new ControlP5(this);

  cp5.addSlider("setG")
		.setPosition(10, 10)
		.setSize(300, 20)
		.setRange(0, 1)
		.setCaptionLabel("Gravity")
    .setValue(fg);

  cp5.addSlider("setK")
    .setPosition(10, 100)
    .setSize(300, 20)
    .setRange(0, 1)
    .setValue(0.01)
    .setCaptionLabel("Spring strenght");

  cp5.addSlider("setFrecuency")
    .setPosition(10, 70)
    .setSize(300, 20)
    .setRange(0, 100)
    .setValue(5)
    .setCaptionLabel("Frecuency of birth");

  cp5.addSlider("setFriction")
    .setPosition(10, 40)
    .setSize(300, 20)
    .setRange(0, 1)
    .setValue(0.01)
    .setCaptionLabel("Friction");

  cp5.addSlider("setRestLen")
    .setPosition(10, 130)
    .setSize(300, 20)
    .setRange(1, 100)
    .setValue(10)
    .setCaptionLabel("Rest lenght");
}

void setG(float value){
	gravity.set(0, value);
}

void setK(float value){
  k = value;
	for(ParticleSystem s : systems){
    s.k = value;
		for(IAgent a : s.agents){
      if (a instanceof Spring){
          Spring sp = (Spring) a;
          sp.k = value;
      }
		}
	}
}

void setFrecuency(float value){
  particlesFrecuency = value;
}

void setFriction(float value){
  friction = value;
	for(ParticleSystem s : systems){
    s.friction = value;
		for(IAgent a : s.agents){
      if (a instanceof Particle){
          Particle p = (Particle) a;
          p.friction = value;
      }
		}
	}
}

void setRestLen(float value){
  restLength = value;
	for(ParticleSystem s : systems){
    s.restLength = value;
		for(IAgent a : s.agents){
      if (a instanceof Spring){
          Spring sp = (Spring) a;
          sp.restLength = value;
      }
		}
	}
}

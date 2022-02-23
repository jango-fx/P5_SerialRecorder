import processing.serial.*;
import controlP5.*;

ControlP5 cp5;

Recorder rec = new Recorder();
public boolean isRecording = false;

void setup()
{
  printArray(Serial.list());
  Serial serialPort = new Serial(this, Serial.list()[4], 9600);

  cp5 = new ControlP5(this);
  cp5.addToggle("isRecording")
    .setPosition(40, 100)
    .setSize(50, 20)
    .setValue(isRecording);
  ;
  cp5.addBang("saveToFile")
    .setPosition(100, 100)
    .setSize(50, 20)
    ;

  size(400, 300);
}

void draw()
{
  background(0);
  text(rec.data.size(), 50, 50);
}

public void saveToFile() {
  rec.saveToFile();
}

void serialEvent(Serial inPort) {
  try {
    String msg = inPort.readStringUntil('\n');
    if (msg != null) {
      msg = msg.trim();
      println(msg);
      parseMessage(msg);
    }
  }
  catch (Exception e) {
    println("[ERROR] serialEvent: ", e);
  }
}

void parseMessage(String msg)
{
  RecorderDatum datum = new RecorderDatum(msg);
  if (isRecording) {
    rec.data.add(datum);
  }
}

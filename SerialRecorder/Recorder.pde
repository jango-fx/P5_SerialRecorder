class Recorder
{
  ArrayList<RecorderDatum> data = new ArrayList<RecorderDatum>();

  void saveToFile()
  {
    String[] lines = new String[data.size()];
    for (int i = 0; i < data.size(); i++)
    {
      lines[i] = data.get(i).toString();
    }
    saveStrings("data.txt", lines);
  }
}

class RecorderDatum
{
  Object[] data;
  int timeStamp;
  RecorderDatum(Object... input)
  {
    timeStamp = millis();
    data = input;
  }
  
  String toString()
  {
    String out = str( timeStamp );
    for (int i = 0; i < data.length; i++)
    {
      out += "\t" + data[i].toString();
    }
    return out;
  }
}

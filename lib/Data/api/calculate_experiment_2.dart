import 'dart:math';

class Experiment2{
  static Map calculate({required List<String> alphabet, required int numExperiments, required int numVDI}){
    List<String> values = [];
    List<double> numbers = [for(int i = 0; i < pow(alphabet.length, numVDI); i++) 0];
    for(int i = 0; i < pow(alphabet.length, numVDI); i++){
      String str = divisionByBase(i, alphabet.length);
      while(str.length != numVDI){
        str = alphabet[0]+str;
      }
      values.add(str);
    }
    Map result = Map<String, double>.fromIterables(
        values,
        numbers
    );
    Random random = Random();
    for(int i = 0; i < pow(alphabet.length, numVDI); i++){
      String strVDI = "";
      for(int j = 0; i < numVDI; j++){
        strVDI+=alphabet[random.nextInt(alphabet.length)];
      }
      result[strVDI] += 1;
    }
    for(int i = 0; i < pow(alphabet.length, numVDI); i++){
      result[values[i]] /= numVDI;
    }
    return result;
  }

  static String divisionByBase(int num, int base) {
    int numResult = num ~/ base;
    int numRemainder = num % base;
    return (num < base ? "" :divisionByBase(numResult, base))+numRemainder.toString();
  }
}
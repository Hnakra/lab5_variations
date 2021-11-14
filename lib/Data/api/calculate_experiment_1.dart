import 'dart:math';

class Experiment1{
  static Map calculate({required List<String> alphabet, required int numExperiments}){
    List<double> numbers = [for(int i = 0; i < alphabet.length; i++) 0];
    Random random = Random();
    for(int i = 0; i < numExperiments; i++){
      numbers[random.nextInt(alphabet.length)] += 1;
    }
    for(int i = 0; i < alphabet.length; i++){
      numbers[i] /= numExperiments;
    }
    Map result = Map<String, double>.fromIterables(
        alphabet,
        numbers
      // Iterable<int>.generate(alphabet.length).toList()
    );
    return result;
  }
}
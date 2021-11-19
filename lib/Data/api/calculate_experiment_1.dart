import 'dart:math';

class Experiment1{
  static Map calculate({required List<String> alphabet, required int numExperiments}){
    ///заполнение массива будующих случайных ведичин каждого символа алфавита нулями
    List<double> numbers = [for(int i = 0; i < alphabet.length; i++) 0];
    Random random = Random();
    /// вызываем случайные символы из алфавита, суммируем его случайную величину на 1
    for(int i = 0; i < numExperiments; i++){
      numbers[random.nextInt(alphabet.length)] += 1;
    }
    /// представим получившиеся случайные величины в диапазоне [0,1]
    for(int i = 0; i < alphabet.length; i++){
      numbers[i] /= numExperiments;
    }
    /// склеим в ассоциативный массив алфавит и получившиеся случайные величины, вернем результат функции
    Map result = Map<String, double>.fromIterables(
        alphabet,
        numbers
      // Iterable<int>.generate(alphabet.length).toList()
    );
    return result;
  }
}
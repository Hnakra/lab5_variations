import 'dart:math';
class Experiment2{
  static Map calculate({required List<String> alphabet, required int numExperiments, required int numVDI}){
    List<String> values = [];
    /// заполняем массив в будущем каждой случайной комбинации нулями
    List<double> numbers = [for(int i = 0; i < pow(alphabet.length, numVDI); i++) 0];
    /// создадим массив всех возможных комбинаций алфавита
    for(int i = 0; i < pow(alphabet.length, numVDI); i++){
      /// получаем рекурсивной функцией эту комбинацию
      String str = divisionByBase(i, alphabet.length, alphabet);
      /// если комбинация на данный момент достаточно мала, добавить необходимое кол-во начальных символов
      while(str.length != numVDI){
        str = alphabet[0]+str;
      }
      ///добавление комбинации в массив
      values.add(str);
    }
    /// склеиваем массивы получившихся комбинаций и случайных величин
    Map result = Map<String, double>.fromIterables(
        values,
        numbers
    );

    Random random = Random();
   /// вычисление случайной величины для каждой комбинации алфавита
    for(int i = 0; i < numExperiments; i++){
      ///вычисление случайной комбинации
      String strVDI = "";
      for(int j = 0; j < numVDI; j++){
        strVDI+=alphabet[random.nextInt(alphabet.length)];
      }
      /// на этом моменте случайная величина вычислена, просуммируем ее на 1
      result[strVDI] += 1;
    }
    /// получаем из получившихся случайных величин числа на [0, 1]
    for(int i = 0; i < pow(alphabet.length, numVDI); i++){
      result[values[i]] /= numExperiments;
    }
    /// возвращение результата
    return result;
  }
/// рекурсивный метод, производящий перевод из 10 системы счисления в base систему счисления, возвращение не числа, а получащейся комбинации алфавита
  static String divisionByBase(int num, int base, List<String> alphabet) {
    int numResult = num ~/ base;
    int numRemainder = num % base;
    return (num < base ? "" :divisionByBase(numResult, base, alphabet))+alphabet[numRemainder];
  }
}
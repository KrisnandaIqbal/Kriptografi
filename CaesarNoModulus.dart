import 'dart:io';

void main(List<String> args) {
  print("");
  print("Caesar Chiper Program");
  print("----------------------");
  print("1 . Enskripsi ");
  print("2 . Dekripsi ");
  print("3 . Keluar   ");
  print("----------------------");
  print(Menu());
}

//
dynamic Menu() {
  stdout.write("Mau coba ? ");
  String pilihan = stdin.readLineSync()!;

  // Yes
  while (pilihan == "y" || pilihan == "Y" || pilihan == "ya" || pilihan == "iya" || pilihan == "Iya") {
    stdout.write("Mau Pilih Nomor Berapa ? ");
    String chooseProgram = stdin.readLineSync()!;
    if (chooseProgram == "1") {
      return Encrypt();
    } else if (chooseProgram == "2") {
      return Decrypt();
    } else if (chooseProgram == "3") {
      return "Terima Kasih";
    } else {
      return "Anda Ngantuk ?";
    }
  }

  // No
  while (pilihan == "t" || pilihan == "T" || pilihan == "tidak" || pilihan == "Tidak") {
    return "Terimakasih Sudah Berkunjung :')";
  }
}

//
String Encrypt() {
  print("");
  print("------------------");
  print("     Enkripsi     ");
  print("------------------");
  stdout.write("Masukkan String : ");
  String str = stdin.readLineSync()!;
  stdout.write("Masukkan Key : ");
  int number = int.parse(stdin.readLineSync()!);

  // Enkripsi
  // number = number % 26;
  var lowerCaseString = str.toLowerCase();
  var abjad = 'abcdefghijklmnopqrstuvwxyz'.split("");
  var newString = '';
  //
  for (var i = 0; i < lowerCaseString.length; i++) {
    var CurrentLetter = lowerCaseString[i];
    if (CurrentLetter == " ") {
      newString += CurrentLetter;
      continue;
    }
    var currentIndex = abjad.indexOf(CurrentLetter);
    //
    var newIndex = currentIndex + number;
    //
    if (newIndex > 25) newIndex = newIndex - 26;
    //
    if (newIndex < 0) newIndex = 26 + newIndex;
    //
    if (str[i] == str[i].toUpperCase()) {
      newString += abjad[newIndex].toUpperCase();
    } else {
      newString += abjad[newIndex];
    }
  }
  return "Hasil : ${newString}";
}

String Decrypt() {
  print("");
  print("------------------");
  print("     Dekripsi     ");
  print("------------------");
  stdout.write("Masukkan String : ");
  String str = stdin.readLineSync()!;
  stdout.write("Masukkan Key : ");
  int number = int.parse(stdin.readLineSync()!);
  // Dekripsi
  // number = number % 26;
  var lowerCaseString = str.toLowerCase();
  var abjad = 'abcdefghijklmnopqrstuvwxyz'.split("");
  var newString = '';
  //
  for (var i = 0; i < lowerCaseString.length; i++) {
    var CurrentLetter = lowerCaseString[i];
    if (CurrentLetter == " ") {
      newString += CurrentLetter;
      continue;
    }
    var currentIndex = abjad.indexOf(CurrentLetter);
    //
    var newIndex = currentIndex - number;
    //
    if (newIndex > 25) newIndex = newIndex - 26;
    //
    if (newIndex < 0) newIndex = 26 + newIndex;
    //
    if (str[i] == str[i].toUpperCase()) {
      newString += abjad[newIndex].toUpperCase();
    } else {
      newString += abjad[newIndex];
    }
  }
  return "Hasil : ${newString}";
}

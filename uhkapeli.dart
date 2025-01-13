import 'dart:io';
import 'dart:math';

main() {
  var arpoja = Random();
  var euroja = 10;

  while (true) {
    print('Rahaa: $euroja. Pelataanko? k=kyllä, muut lopettaa.');
    var komento = stdin.readLineSync();

    if (komento != 'k') {
      break;
    }

    euroja = euroja - 1;

    var luku = arpoja.nextDouble();
    var takaisin = palautus(luku);
    print('Palautus: $takaisin');

    euroja = euroja + takaisin;

    if (euroja <= 0) {
      print('Rahat loppuivat.');
      break;
    }
  }

  print('Rahaa jäljellä: $euroja');
}

palautus(luku) {
  if (luku < 0.1) {
    return 20;
  } else if (luku < 0.5) {
    return 10;
  } else if (luku < 0.8) {
    return 5;
  } else {
    return 0;
  }
}

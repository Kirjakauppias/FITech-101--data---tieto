import 'dart:io';
import 'dart:math';

/* Tehtäväpohjassa on uhkapeli. Uhkapelin toteuttaja on tehnyt pelin palautusprosentista uhkapelin järjestäjälle epäsuotuisan
 -- keskimäärin pelin pelaajat voittavat rahaa rahan häviämisen sijaan. Muokkaa ohjelmassa olevaa funktiota palautus(luku) siten, 
 että uhkapelin palautusprosentti on korkeintaan 80. */
main() {
  var arpoja = Random(); // Luodaan satunnaislukugeneraattori.
  var euroja = 10; // Pelaajalla on aluksi 10 euroa.

  while (true) { // Jatketaan peliä, kunnes käyttäjä haluaa lopettaa tai rahat loppuvat.
    print('Rahaa: $euroja. Pelataanko? k=kyllä, muut lopettaa.');
    var komento = stdin.readLineSync(); // Pyydetään käyttäjältä syöte: 'k' pelaamiseen, muu lopettaa.

    if (komento != 'k') { // Jos syöte ei ole 'k', peli päättyy.
      break;
    }

    euroja = euroja - 1; // Jokainen pelikierros maksaa 1 euron.

    var luku = arpoja.nextDouble(); // Arvotaan luku väliltä (0.0, 1.0).
    var takaisin = palautus(luku); // Selvitetään palautuksen määrä arvotun luvun perusteella.
    print('Palautus: $takaisin');

    euroja = euroja + takaisin; // Lisätään palautus pelaajan euroihin.

    if (euroja <= 0) { // Jos rahat loppuvat, peli päättyy.
      print('Rahat loppuivat.');
      break;
    }
  }

  print('Rahaa jäljellä: $euroja'); // Tulostetaan lopullinen rahamäärä.
}

// Tämä funktio määrittää pelin palautuslogiikan.
// Parametri 'luku' on satunnainen arvo väliltä (0.0, 1.0).
// Funktio palauttaa summan, joka pelaajalle maksetaan voittona.
palautus(luku) {
  if (luku < 0.05) { // 5% todennäköisyydellä pelaaja voittaa 5 euroa.
    return 5;
  } else if (luku < 0.3) { // 25% todennäköisyydellä pelaaja voittaa 1 euron.
    return 1;
  } else { // 70% todennäköisyydellä pelaaja ei voita mitään.
    return 0;
  }
}

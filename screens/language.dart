import 'package:flutter/material.dart';

enum Languages { english, espanol, francais, portuges, igbo, twi }

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  Languages? _character = Languages.english;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Container(
            height: 100,
            color: Colors.black,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Language',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'MontserratSemiBold',
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Select preferred language',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'MontserratThin',
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),

          //English
          RadioListTile<Languages>(
            title: const Text(
              'English',
              style: TextStyle(
                fontFamily: 'MontserratMedium',
              ),
            ),
            value: Languages.english,
            activeColor: Colors.green,
            groupValue: _character,
            onChanged: (Languages? value) {
              setState(() {
                _character = value;
              });
            },
          ),

          //Espanol
          RadioListTile<Languages>(
            title: const Text(
              'Espanol',
              style: TextStyle(
                fontFamily: 'MontserratMedium',
              ),
            ),
            value: Languages.espanol,
            activeColor: Colors.green,
            groupValue: _character,
            onChanged: (Languages? value) {
              setState(() {
                _character = value;
              });
            },
          ),

          //Francais
          RadioListTile<Languages>(
            title: const Text(
              'Francais',
              style: TextStyle(
                fontFamily: 'MontserratMedium',
              ),
            ),
            value: Languages.francais,
            activeColor: Colors.green,
            groupValue: _character,
            onChanged: (Languages? value) {
              setState(() {
                _character = value;
              });
            },
          ),

          //Portuges
          RadioListTile<Languages>(
            title: const Text(
              'Portuges',
              style: TextStyle(
                fontFamily: 'MontserratMedium',
              ),
            ),
            value: Languages.portuges,
            activeColor: Colors.green,
            groupValue: _character,
            onChanged: (Languages? value) {
              setState(() {
                _character = value;
              });
            },
          ),

          //Igbo
          RadioListTile<Languages>(
            title: const Text(
              'Igbo',
              style: TextStyle(
                fontFamily: 'MontserratMedium',
              ),
            ),
            value: Languages.igbo,
            activeColor: Colors.green,
            groupValue: _character,
            onChanged: (Languages? value) {
              setState(() {
                _character = value;
              });
            },
          ),

          //Twi
          RadioListTile<Languages>(
            title: const Text(
              'Twi',
              style: TextStyle(
                fontFamily: 'MontserratMedium',
              ),
            ),
            value: Languages.twi,
            activeColor: Colors.green,
            groupValue: _character,
            onChanged: (Languages? value) {
              setState(() {
                _character = value;
              });
            },
          ),

          SizedBox(
            height: 50,
          ),

        ],
      ),
    );
  }
}

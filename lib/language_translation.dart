import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslationPage extends StatefulWidget {
  const LanguageTranslationPage({super.key});

  @override
  State<LanguageTranslationPage> createState() => _LanguageTranslationPageState();
}

class _LanguageTranslationPageState extends State<LanguageTranslationPage> {
  var languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Chinese',
    'Japanese',
    'Russian',
  ];

  var originalLanguage = 'Select Language';
  var translatedLanguage = 'Translated Language';
  var output = "";
  TextEditingController languageController = TextEditingController();

  void translate(String src, String dest, String input) async {
    GoogleTranslator translator =  GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest);
    setState(() {
      output = translation.text.toString();
    });

    if(src == '--' || dest == '--'){
      setState(() {
        output = "Failed to translate";
      });
    }
  }

  String getLanguageCode (String language){
    switch(language){
      case 'English':
        return 'en';
      case 'Spanish':
        return 'es';
      case 'French':
        return 'fr';
      case 'German':
        return 'de';
      case 'Chinese':
        return 'zh-CN';
      case 'Japanese':
        return 'ja';
      case 'Russian':
        return 'ru';
      default:
        return '--';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF10223D),
      appBar: AppBar(
        title: const Text('Languo', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFF10223D),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: DropdownButton(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(
                      originalLanguage,
                      style: TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: languages.map((String dropDownStringItem){
                      return DropdownMenuItem(
                        value: dropDownStringItem,
                        child: Text(
                          dropDownStringItem,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value){
                      setState(() {
                        originalLanguage = value!;
                      });
                    },
                  ),
                  ),
                  SizedBox(width: 10.0),
                  Icon(Icons.arrow_right_alt_outlined, color: Colors.white, size: 40.0),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: DropdownButton(
                      focusColor: Colors.white,
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.white,
                      hint: Text(
                        translatedLanguage,
                        style: TextStyle(color: Colors.white),
                      ),
                      dropdownColor: Colors.white,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: languages.map((String dropDownStringItem){
                        return DropdownMenuItem(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value){
                        setState(() {
                          translatedLanguage = value!;
                        });
                      },
                    ),
                  )
                  
                ],
              ),
              SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  controller: languageController,
                  decoration: InputDecoration(
                    labelText: 'Enter text to translate...',
                    labelStyle: TextStyle(fontSize:15, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white,width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white,width: 1.0),
                    ),
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
                  ),
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter text to translate';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      output = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6200EE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text('Translate', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                   translate(getLanguageCode(originalLanguage), getLanguageCode(translatedLanguage), languageController.text.toString());
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    output,
                    style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
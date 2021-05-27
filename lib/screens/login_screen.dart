import 'package:flutter/material.dart';
import 'package:shukrann_new/classes/language.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void _changeLanguage(Language language) {
    print(language.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text('Shukran'),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: DropdownButton(
              onChanged: (Language language) {
                _changeLanguage(language);
              },
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                        value: lang,
                        child: Row(
                          children: [
                            Text(
                              lang.name,
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Text(lang.flag)
                          ],
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              Image.asset(
                'images/logo.png',
                height: 150.0,
                width: 150.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: ('Your Name'),
                  hintText: ('Name'),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: ('Your Email'),
                  hintText: ('Email'),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: ('Your Password'),
                  hintText: ('Password'),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              MaterialButton(
                onPressed: () {
                  if (_key.currentState.validate()) {}
                },
                height: 50.0,
                shape: StadiumBorder(),
                color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

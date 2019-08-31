import 'package:app_guia_sh/screens/about_us_screen.dart';
import 'package:app_guia_sh/screens/home_screen.dart';
import 'package:app_guia_sh/screens/privacy_screen.dart';
import 'package:flutter/material.dart';

class ContactTab extends StatefulWidget {
  var _pageController = PageController();

  ContactTab(this._pageController);

  @override
  _ContactTabState createState() => _ContactTabState(_pageController);
}

class _ContactTabState extends State<ContactTab> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var _pageController = PageController();

  _ContactTabState(this._pageController);

  String dropdownValue = 'Sugestão';
  bool news = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //drawer: CustomDrawer(_pageController),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeScreen()));
            }),
        title: Text("Contato",
            style: TextStyle(shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ])),
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(hintText: "Nome"),
              validator: (text) {
                if (text.isEmpty) return "Nome Inválido!";
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(hintText: "E-mail"),
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if (text.isEmpty || !text.contains("@"))
                  return "E-mail inválido!";
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: <Widget>[
                Text("Assunto:  "),
                Expanded(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    isExpanded: true,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>[
                      'Sugestão',
                      'Critíca',
                      'Bug',
                      'Solicitação',
                      'Outros'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              controller: _addressController,
              decoration: InputDecoration(hintText: "Mensagem"),
              validator: (text) {
                if (text.isEmpty) return "Mensagem inválido!";
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Checkbox(
                  value: true,
                ),
                Text("Aceito os termos da "),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PrivacyScreen()));
                  },
                  child: Text(
                    "Politica de Privacidade",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Checkbox(
                  value: news,
                  onChanged: (bool value) {
                    setState(() {
                      news = value;
                    });
                  },
                ),
                Text("Quero Receber Novidades do "),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AboutUsScreen()));
                  },
                  child: Text(
                    "Guia66",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                child: Text(
                  "Enviar",
                  style: TextStyle(fontSize: 18.0, shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ]),
                ),
                textColor: Colors.white,
                color: Colors.orange,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _nameController.text = "";
                    _passController.text = "";
                    _emailController.text = "";
                    _addressController.text = "";
                    dropdownValue = "Sugestão";

                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text(
                          'Sua Mensagem foi enviado com sucesso !',
                          style: TextStyle(color: Colors.white),
                        ),
                        duration: Duration(seconds: 6),
                        backgroundColor: Colors.green));
                  } else {
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text(
                          'Preencha todos os campos !',
                          style: TextStyle(color: Colors.white),
                        ),
                        duration: Duration(seconds: 6),
                        backgroundColor: Colors.red));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

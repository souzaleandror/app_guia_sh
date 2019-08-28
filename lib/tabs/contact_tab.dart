import 'package:app_guia_sh/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ContactTab extends StatelessWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var _pageController = PageController();

  ContactTab(this._pageController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            TextFormField(
              controller: _passController,
              decoration: InputDecoration(hintText: "Assunto"),
              obscureText: true,
              validator: (text) {
                if (text.isEmpty || text.length < 6) return "Assunto inválida!";
              },
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
            SizedBox(
              height: 16.0,
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
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

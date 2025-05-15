// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors, use_build_context_synchronously, no_leading_underscores_for_local_identifiers, unused_element
import 'dart:convert';
import 'package:baskiti/homepage.dart';
import 'package:baskiti/order.dart';
import 'package:baskiti/panier.dart';
import 'package:baskiti/user.dart';
import 'package:baskiti/usertemp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => UserTempProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bienvenu sur Baskiti',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _onLogin() async {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Veuillez remplir tous les champs.")),
      );
      return;
    }

    try {
      final Map<String, String> parameters = {
        'username': username,
        'password': password,
      };

      final response = await http.post(
        Uri.parse("https://baskiti.ma/index.php?option=com_application&task=connect"),
        body: parameters,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse.containsKey('user_id')) {
          Provider.of<UserProvider>(context, listen: false).setUserData(
            id: jsonResponse['user_id'],
            username: jsonResponse['username'],
            email: jsonResponse['email'],
            name: jsonResponse['username'],
            points: jsonResponse['points'],
            last_name: jsonResponse['last_name'],
            phone_1: jsonResponse['phone_1'],
            address_1: jsonResponse['address_1'],
            city: jsonResponse['city'],
            first_name: jsonResponse['first_name'],
            zip: jsonResponse['zip'],
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(jsonResponse['error'])),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Un problème est survenu, veuillez réessayer ultérieurement")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Un problème est survenu de serveur, veuillez réessayer ultérieurement")),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Container(
                  width: 150,
                  height: 43,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 40),

                // Champ Email
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Nom d'utilisateur",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Champ Mot de passe
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Bouton de connexion
                ElevatedButton(
                  onPressed: _onLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE85E24),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Se connecter',
                    style: TextStyle(fontSize: 18, color: Color(0xFF00253D)),
                  ),
                ),
                SizedBox(height: 20),

                // Lien de mot de passe oublié
                TextButton(
                  onPressed: () {
                    // Logique pour mot de passe oublié
                  },
                  child: Text(
                    'Mot de passe oublié ?',
                    style: TextStyle(color: Color(0xFFE85E24)),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Logique pour créer un compte
                  },
                  child: Text(
                    'Créer un compte ?',
                    style: TextStyle(color: Color(0xFFE85E24)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

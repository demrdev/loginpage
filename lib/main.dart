import 'package:flutter/material.dart';
import 'package:flutter_application_1/authentication_service.dart';
import 'package:flutter_application_1/login_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: ChangeNotifierProvider(
          create: (context) => LoginModel(authService: AuthenticationService()),
          child: LoginScreen(),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginModel>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Email'),
            onChanged: (value) => model.email = value,
          ),
          SizedBox(height: 8.0),
          TextField(
            decoration: InputDecoration(labelText: 'Password'),
            onChanged: (value) => model.password = value,
            obscureText: true,
          ),
          SizedBox(height: 24.0),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: model.isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      bool success = await model.login();
                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login successful')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login failed')),
                        );
                      }
                    },
                    child: Text('Login'),
                  ),
          ),
        ],
      ),
    );
  }
}

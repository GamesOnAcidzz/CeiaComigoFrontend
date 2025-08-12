import 'package:ceia_comigo/services/user_client_services.dart';
import 'package:flutter/material.dart';
import '../viewmodels/user_client_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserClientViewmodel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ceia Comigo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(111, 207, 83, 1),
        ),
      ),
      home: LoginForm(),
    );
  }
}

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Account"), centerTitle: true),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: Stack(
            alignment: Alignment(0.0, 0.0),
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hint: Text("Enter your display name"),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hint: Text("Enter your email"),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hint: Text("Enter your password"),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 24),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hint: Text("Confirm your password"),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    child: FilledButton(
                      onPressed: () {},
                      child: Text("Create account"),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Text("Already have an account"),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Login here"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  bool isLoading = false;
  bool hasError = false;
  String errorMessage = "Error goes here";
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    Future<void> _handleLogin() async {
      setState(() {
        isLoading = true;
      });
      final viewModel = Provider.of<UserClientViewmodel>(
        context,
        listen: false,
      );
      final result = await viewModel.validateUserClient(
        emailController.text,
        passwordController.text,
      );
      switch (result) {
        case UserClientValidation.validPassword:
          {
            setState(() {
              hasError = true;
              errorMessage = "VALID ACCOUNT";
            });
          }
        case UserClientValidation.wrongEmail:
          {
            setState(() {
              hasError = true;
              errorMessage = "Invalid email";
            });
          }
        case UserClientValidation.invalidPassword:
          {
            setState(() {
              hasError = true;
              errorMessage = "Wrong password";
            });
          }
        default:
          {
            setState(() {
              hasError = true;
              errorMessage =
                  "Something went wrong, probably internet connection";
            });
          }
      }
      setState(() {
        isLoading = false;
      });
    }

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(title: Text("Login Account"), centerTitle: true),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: Stack(
            alignment: Alignment(0.0, 0.0),
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hint: Text("Enter your email"),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hint: Text("Enter your password"),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (bool) {}),
                      Text("Keep me logged in."),
                    ],
                  ),
                  SizedBox(height: 2),
                  isLoading
                      ? CircularProgressIndicator()
                      : SizedBox(
                          child: FilledButton(
                            onPressed: () async {
                              await _handleLogin();
                            },
                            child: Text("Login"),
                          ),
                        ),
                  Row(
                    children: [
                      Text("Forgot password?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterForm(),
                            ),
                          );
                        },
                        child: Text("Recover here"),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: hasError,
                    child: Text(
                      errorMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterForm(),
                          ),
                        );
                      },
                      child: Text("Signup here"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

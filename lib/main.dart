import 'package:ceia_comigo/services/user_client_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../viewmodels/user_client_viewmodel.dart';
import 'package:provider/provider.dart';
import '../home.dart';
import '../theme.dart';

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
        textTheme: GoogleFonts.aBeeZeeTextTheme(),
        useMaterial3: true,
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
        colorScheme: MaterialTheme.lightScheme(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: MaterialTheme.darkScheme(),
      ),
      themeMode: ThemeMode.system,
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginForm(),
        "/register": (context) => RegisterForm(),
        "/home": (context) => Home(),
      },
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> handleLogin() async {
    setState(() {
      isLoading = true;
    });
    final viewModel = Provider.of<UserClientViewmodel>(context, listen: false);
    final result = await viewModel.validateUserClient(
      emailController.text,
      passwordController.text,
    );
    debugPrint("Result: $result");
    switch (result) {
      case UserClientValidation.validPassword:
        {
          Navigator.pushNamed(context, "/home");
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
            errorMessage = "Something went wrong, probably internet connection";
          });
        }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(title: Text("Login Account"), centerTitle: true),
      body: Center(
        child: Container(
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
                              style: FilledButton.styleFrom(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.primary,
                              ),
                              onPressed: () async {
                                await handleLogin();
                              },
                              child: Text("Login"),
                            ),
                          ),
                    Row(
                      children: [
                        Text("Forgot password?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/login");
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
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
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
                          Navigator.pushNamed(context, "/register");
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
      ),
    );
  }
}

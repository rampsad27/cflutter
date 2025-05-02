import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ig/repository/googleauth_repository.dart';
import 'package:ig/ui/modules/loginauth/bloc/login_bloc.dart';
import 'package:ig/ui/modules/screen/feed.dart';

// LoginPage widget for user authentication
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers for email and password fields
  final TextEditingController _econtroller = TextEditingController();
  final TextEditingController _pcontroller = TextEditingController();
  // Form key for form validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Flag to toggle password visibility
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    super.dispose();
    // Dispose controllers to free up resources
    _econtroller.dispose();
    _pcontroller.dispose();
  }

  // Function to show the "Forgot Password" dialog
  _showForgotPasswordDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text("OK"), // Placeholder text for now
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  // Function to handle login button press
  void _login() {
    if (_formKey.currentState!.validate()) {
      String email = _econtroller.text;
      String password = _pcontroller.text;
      // Trigger LoginRequested event in LoginBloc
      context
          .read<LoginBloc>()
          .add(LoginRequested(email: email, password: password));
    }
  }

  @override
  void initState() {
    super.initState();
    // Check if user is already logged in when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LoginBloc>().add(CheckLoggedInUser());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        // Navigate to FeedScreen on successful login
        if (state is LoginSuccess) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const FeedScreen()));
        }
        // Show error message if login fails
        else if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 158, 32, 32),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Instagram", // Title text
                          style: TextStyle(
                            fontFamily: "S",
                            fontSize: 60,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Email or username input field
                        TextFormField(
                          controller: _econtroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter data"; // Validation message
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Phone number, username or email",
                          ),
                        ),
                        // Password input field
                        TextFormField(
                          controller: _pcontroller,
                          obscureText: !_isPasswordVisible,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Wrong password"; // Validation message
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // "Forgot password?" link
                        InkWell(
                          onTap: _showForgotPasswordDialog,
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Login button with loading indicator
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: () {
                                _login();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: state is LoginLoadInProgress
                                  ? const CircularProgressIndicator()
                                  : const SizedBox(
                                      height: 40,
                                      width: 330,
                                      child: Center(
                                        child: Text(
                                          "Log in",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        // Divider with "OR" text
                        const Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Color.fromARGB(255, 127, 127, 127),
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "OR",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 127, 127, 127),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Color.fromARGB(255, 127, 127, 127),
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Placeholder for Google Sign-In button
                            // Uncomment and add functionality if needed
                          ],
                        ),
                        // SignUp with Email and Password
                        InkWell(
                          onTap: () async {
                            GoogleSignInRepository googleSignInRepository =
                                GoogleSignInRepository();
                            await googleSignInRepository
                                .signUpWithEmailandPassword(
                                    "dfdfg@gamil.com", "iloveacemmm");
                          },
                          child: const Text(
                            "SignUp with EmailPassword ",
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                        // SignIn with Email and Password
                        InkWell(
                          onTap: () async {
                            GoogleSignInRepository googleSignInRepository =
                                GoogleSignInRepository();
                            await googleSignInRepository
                                .signInWithEmailAndPassword(
                                    "dfdfg@gamil.com", "iloveacemmm");
                          },
                          child: const Text(
                            "SignIn with EmailPassword ",
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Sign up prompt
            RichText(
              text: const TextSpan(
                text: "Don't have an account? ",
                style: TextStyle(color: Colors.grey),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign Up.',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }
}

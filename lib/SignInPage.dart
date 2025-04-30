import 'package:flutter/material.dart';
import 'SignUpPage.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double height = constraints.maxHeight;

          // Define breakpoints for responsiveness
          bool isMobile = width < 600; // Mobile
          bool isTablet = width >= 600 && width < 1200; // Tablet
          bool isDesktop = width >= 1200; // Desktop

          // Define responsive values
          double padding = isMobile ? width * 0.1 : (isTablet ? width * 0.05 : width * 0.02);
          double fontSizeTitle = isMobile ? width * 0.07 : (isTablet ? width * 0.06 : width * 0.04);
          double fontSizeButton = isMobile ? width * 0.05 : (isTablet ? width * 0.045 : width * 0.035);
          double buttonPadding = isMobile ? height * 0.025 : (isTablet ? height * 0.02 : height * 0.015);

          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: height * (isMobile ? 0.1 : 0.15)), // Responsive top padding
                    Text(
                      "Welcome Back!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: fontSizeTitle, // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFDC1E76),
                      ),
                    ),
                    SizedBox(height: height * (isMobile ? 0.05 : 0.08)), // Space after title
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email, color: Color(0xFFDC1E76)),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: height * (isMobile ? 0.02 : 0.03)), // Space after email field
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock, color: Color(0xFFDC1E76)),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: height * (isMobile ? 0.04 : 0.05)), // Space after password field
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFDC1E76),
                        padding: EdgeInsets.symmetric(vertical: buttonPadding), // Adaptive vertical padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: fontSizeButton,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: height * (isMobile ? 0.03 : 0.04)), // Space after button
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: Text(
                        "Don't have an account? Sign Up",
                        style: TextStyle(
                          color: Color(0xFFDC1E76),
                          fontSize: width * 0.04,
                        ),
                      ),
                    ),
                    SizedBox(height: height * (isMobile ? 0.1 : 0.15)), // Bottom padding
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

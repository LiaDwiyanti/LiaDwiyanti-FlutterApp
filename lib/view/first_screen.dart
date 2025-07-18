import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/providers/palindrom_provider.dart';
import 'package:mobile_app/view/second_screen.dart';
import 'package:mobile_app/providers/user_provider.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PalindromeProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 100.0)),
                    Image.asset(
                      'assets/images/btn_add_ft.png',
                      height: 116.0,
                    ),
                    SizedBox(height: 70.0),
                    TextField(
                      onChanged: (value) => provider.setName(value),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(202, 158, 158, 158),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 238, 238, 238), width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 20, 181, 255), width: 1.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      onChanged: (value) => provider.setPalindrome(value),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        hintText: 'Palindrome',
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(202, 158, 158, 158),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 238, 238, 238), width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 20, 181, 255), width: 1.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    ElevatedButton(
                      onPressed: () {
                        final palindrome = provider.palindrome;
                        if (palindrome.isNotEmpty) {
                          final isPalin = provider.isPalindrome();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(isPalin ? 'isPalindrome' : 'Not palindrome'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: const Color(0xFF2B637B),
                      ),
                      child: Text(
                        'CHECK',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<UserProvider>(context, listen: false).clearUser();
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (_) => SecondScreen())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: const Color(0xFF2B637B),
                      ),
                      child: Text(
                        'NEXT',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
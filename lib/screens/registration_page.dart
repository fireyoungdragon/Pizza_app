import 'package:auth_page/utils/global_theme.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(
          width: 1,
          color: Color(0xFFeceff1),
        ));

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.people,
                        color: blackColor,
                      ),
                    ),
                    Text(
                      'Registration',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                height: 1,
                color: blackColor,
              ),
              const Text(
                'Please enter your phone number and email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 14, bottom: 6),
                child: Text(
                  'Phone number',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              const TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFeceff1),
                  enabledBorder: _borderStyle,
                  focusedBorder: _borderStyle,
                  prefix: Text(
                    '+7 ',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.4)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 14, bottom: 6),
                child: Text(
                  'Email',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFeceff1),
                  enabledBorder: _borderStyle,
                  focusedBorder: _borderStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 24, bottom: 14),
                child: const Text(
                    'You will receive 4-digit code, that will be your password',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: const Text(
                  'You can change your password after registration at any time',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              SizedBox(
                width: 154,
                height: 42,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Sent 4-dgit code',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: InkWell(
                  child: const Text(
                    'Go back',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        decoration: TextDecoration.underline,
                        fontSize: 16),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

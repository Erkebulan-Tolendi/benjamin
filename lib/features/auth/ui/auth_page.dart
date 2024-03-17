import 'package:benjamin/features/type_select_page/ui/type_selecting_page.dart';
import 'package:flutter/material.dart';
import 'package:masked_text_field/masked_text_field.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController phoneTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();

  void _checkPhoneNumber(BuildContext context) {
    final phoneNumber = phoneTextController.text;
    final userName = nameTextController.text;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              TypeSelectPage(phoneNum: "+7 $phoneNumber", userName: userName)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Авторизация"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50.0, bottom: 4.0),
                    child: Text(
                      "Введите номер \n мобильного телефона и имя",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 20),
                    child: MaskedTextField(
                      textFieldController: phoneTextController,
                      inputDecoration: const InputDecoration(
                        hintText: '(___)-___-__-__',
                        prefixText: '+7 ',
                      ),
                      autofocus: true,
                      mask: '(xxx)-xxx-xx-xx',
                      maxLength: 15,
                      keyboardType: TextInputType.number,
                      onChange: (String value) {
                        //print("+7$value");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextField(
                      controller: nameTextController,
                      autofocus: true,
                      maxLength: 30,
                      keyboardType: TextInputType.text,
                      // onChanged: (String value) {
                      //   print(value);
                      // },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _checkPhoneNumber(context),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.blue,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 140.0),
                        child: Row(
                          children: [
                            Text(
                              'Далее',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.orange.shade100,
                              ),
                            ),
                            const SizedBox(width: 110),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

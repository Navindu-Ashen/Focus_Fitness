import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:focus_fitnesss/Screens/Profiles/confirm.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class ReNewMembership extends StatefulWidget {
  const ReNewMembership({
    super.key,
    required this.schedule,
    required this.userName,
    required this.userEmail,
  });

  final String userName;
  final String schedule;
  final String userEmail;

  @override
  State<ReNewMembership> createState() => _ReNewMembershipState();
}

class _ReNewMembershipState extends State<ReNewMembership> {
  final _form = GlobalKey<FormState>();
  var cardNumber = "";
  var cardName = "";
  var expDate = "";
  var cvv = "";
  String paymentAmount = "LKR 8000.00";
  String formattedDate2 = "";
  bool _isValidating = false;

  void _submit() async {
    final now2 = DateTime.now();
    formattedDate2 = formatter.format(now2);
    final _isValid = _form.currentState!.validate();
    if (!_isValid) {
      return;
    }

    _form.currentState!.save();
    FocusScope.of(context).unfocus();

    setState(() {
      _isValidating = true;
    });

    await FirebaseFirestore.instance.collection("mail").doc().set(
      {
        "to": [widget.userEmail],
        "message": {
          "subject": "Payment Confirmation",
          "text": "Payment Confirmation body",
          "html":
              "<html lang='en'>   <head>     <meta charset='UTF-8' />     <meta name='viewport' content='width=device-width, initial-scale=1.0' />     <style>       @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');       * {         box-sizing: border-box;         margin: 0;         padding: 0;         font-family: 'Poppins', sans-serif !important;       }       @media (max-width: 600px) {         .bodyContainer {           padding: 0px 10px 0px 10px !important;         }         .textH {           font-size: 22px !important;         }         .textB {           font-size: 18px !important;         }       }       @media (max-width: 400px) {         .bodyContainer {           padding: 0px 0px 0px 0px !important;         }         .textH {           font-size: 20px !important;         }         .textB {           font-size: 16px !important;         }       }     </style>   </head>   <body>     <div       class='baseContainer'       style='width: 100%; background-color: black; padding: 30px 0px 30px 0px'     >       <p         style='           text-align: center;           font-size: 36px;           font-weight: bolder;           color: white;         '       >         FOCUS FITNESS       </p>     </div>     <div style='background-color: #acacac; color: rgb(0, 0, 0); padding: 20px'>       <p         class='textH'         style='           text-align: center;           font-size: 26px;           font-weight: bolder;           margin-bottom: 20px;         '       >         Your payment confirmed!       </p>        <div class='bodyContainer' style='padding: 0px 50px 0px 50px'>         <p           class='textB'           style='             text-align: left;             font-size: 20px;             font-weight: normal;             margin: 20px;           '         >           Dear ${widget.userName},         </p>         <p           class='textB'           style='             text-align: left;             font-size: 20px;             font-weight: normal;             margin: 20px;           '         >           We are thrilled to inform you that your gym membership payment has           been successfully processed. <br />           Welcome aboard to FOCUS FITNESS! <br />         </p>          <p           class='textB'           style='             text-align: left;             font-size: 20px;             font-weight: normal;             margin: 20px;           '         >           Here are the details of your membership: <br />         </p>         <p           class='textB'           style='             text-align: left;             font-size: 20px;             font-weight: 600;             margin: 20px;           '         >           Schedule Name: ${widget.schedule} <br />           Payment Date: ${formattedDate2} <br />           Payment amount: ${paymentAmount} <br />         </p>         <p           class='textB'           style='             text-align: left;             font-size: 20px;             font-weight: normal;             margin: 20px;           '         >           Thank you for choosing FOCUSFITNESS as your fitness partner. We look           forward to seeing you at the gym and supporting you every step of the           way.         </p>         <p           class='textB'           style='             text-align: left;             font-size: 20px;             font-weight: normal;             margin-left: 20px;           '         >           Best regards,         </p>         <p           class='textB'           style='             text-align: left;             font-size: 20px;             font-weight: normal;             margin-left: 20px;           '         >           FOCUS FITNESS Management.         </p>       </div>     </div>     <div       style='         background-color: black;         padding-top: 20px;         width: 100%;       '     >       <p style='color: white; text-align: center; padding-bottom: 10px;'>Thankyou!</p>        <p style='color: white; text-align: center; padding-bottom: 30px;'>         Contact us : focusfitness@inquriy.com       </p>     </div>        </body> </html>"
        }
      },
    );

    setState(() {
      _isValidating = false;
    });

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => ConfirmationPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    color: const Color.fromARGB(255, 164, 162, 162),
                    width: double.infinity,
                    height: 75,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Re-new Membership",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "make your next step",
                          style: TextStyle(
                              color: Color.fromARGB(255, 51, 49, 49),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    "Membership details",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Container(
                    height: 60,
                    width: 380,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 60, 60, 60),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Stack(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            "User Name :",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 15,
                          child: Text(
                            widget.userName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: 60,
                    width: 380,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 60, 60, 60),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Stack(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            "Active workout plan :",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 15,
                          child: Text(
                            widget.schedule,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: 60,
                    width: 380,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 60, 60, 60),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            "Payment amount ( per month ) :",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 15,
                          child: Text(
                            "LKR 8000",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "Bank card details",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    height: 55,
                    width: 380,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 60, 60, 60),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Card number',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length != 16) {
                          return "Enter a valid card number";
                        }

                        return null;
                      },
                      onSaved: (value) {
                        cardNumber = value!;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Container(
                    height: 55,
                    width: 380,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 60, 60, 60),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Card holders name',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a card holders name";
                        }

                        return null;
                      },
                      onSaved: (value) {
                        cardName = value!;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Container(
                    height: 55,
                    width: 380,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 60, 60, 60),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Expire date (MM/YYYY)',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a expired date";
                        }

                        return null;
                      },
                      onSaved: (value) {
                        expDate = value!;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Container(
                    height: 55,
                    width: 380,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 60, 60, 60),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'CVV',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length != 3) {
                          return "Enter a valid CVV";
                        }

                        return null;
                      },
                      onSaved: (value) {
                        cvv = value!;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (!_isValidating)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submit,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 94, 94),
                        ),
                        child: const Center(
                          child: Text(
                            "Pay now",
                            style: TextStyle(
                              letterSpacing: 1.7,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (_isValidating)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submit,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 94, 94),
                        ),
                        child: const Center(
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 155),
                  child: Image.asset(
                    'assets/logo.png',
                    height: 100,
                    width: 100,
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

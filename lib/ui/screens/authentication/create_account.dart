import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/ui/config/constants/colors.dart';
import 'package:peer_gig/ui/widgets/authentication/sign_in_button.dart';
import '../../widgets/authentication/custom_text_field.dart';
import '../../widgets/common/drop_down_button.dart';
import '../../../data/common/filter_repository.dart';

class CreateAccount extends StatefulWidget {
  static const routeName = '/createNewAccount';
  final String email;
  const CreateAccount(this.email, {Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  
  FilterRepository obj = FilterRepository();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [AppColors.primary!, AppColors.secondary!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.60, 1.0],
          )
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20.0),
                const Image(
                  image: AssetImage(
                    'assets/images/add_profile_pic.png',
                  ),
                  alignment: Alignment.center,
                  height: 100.0,
                  width: 100.0,
                ),
                const SizedBox(height: 10.0),
                Text('Add Profile Pic',
                  style: GoogleFonts.mallanna(
                    color: AppColors.primaryLight,
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),                
                const SizedBox(height: 20.0),  
                Form(
                  child: Column(
                    children: [                      
                      const CustomTextField(txt: 'Full Name', password: false,),
                      const SizedBox(height: 20.0),
                      const CustomTextField(txt: 'Email Id', password: false,),
                      const SizedBox(height: 20.0),
                      const CustomTextField(txt: 'Password', password: true,),
                      const SizedBox(height: 20.0),
                      const CustomTextField(txt: 'Headline', password: false,),
                      const SizedBox(height: 20.0),
                      FutureBuilder(
                        future: obj.getCourseList(),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
                            if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                              //return const Text("Something went wrong");
                            }
                            if (snapshot.connectionState == ConnectionState.done || snapshot.hasData) {
                              List<String> data = snapshot.data;
                              return CustomDropDownButton(txt: 'Course', fields: data, filter: false);
                            }
                            return const CircularProgressIndicator();
                        },
                      ),
                      const SizedBox(height: 20.0),
                      FutureBuilder(
                        future: obj.getBranchList(),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
                            if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                              //return const Text("Something went wrong");
                            }
                            if (snapshot.connectionState == ConnectionState.done || snapshot.hasData) {
                              List<String> data = snapshot.data;
                              return CustomDropDownButton(txt: 'Branch', fields: data, filter: false);
                            }
                            return const CircularProgressIndicator();
                        },
                      ),
                      const SizedBox(height: 20.0),
                      FutureBuilder(
                        future: obj.getYearList(),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
                            if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                              //return const Text("Something went wrong");
                            }
                            if (snapshot.connectionState == ConnectionState.done || snapshot.hasData) {
                              List<String> data = List<String>.from(snapshot.data);
                              return CustomDropDownButton(txt: 'Year', fields: data, filter: false);
                            }
                            return const CircularProgressIndicator();
                        },
                      ),
                      const SizedBox(height: 20.0),
                      FutureBuilder(
                        future: obj.getCompanyList(),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
                            if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                              //return const Text("Something went wrong");
                            }
                            if (snapshot.connectionState == ConnectionState.done || snapshot.hasData) {
                              List<String> data = snapshot.data;
                              return CustomDropDownButton(txt: 'Company', fields: data, filter: false);
                            }
                            return const CircularProgressIndicator();
                        },
                      ),                   
                      const SizedBox(height: 20.0),
                      const CustomTextField(txt: 'Experience', password: false,),
                      const SizedBox(height: 20.0),
                      FutureBuilder(
                        future: obj.getAchievementsList(),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
                            if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                              //return const Text("Something went wrong");
                            }
                            if (snapshot.connectionState == ConnectionState.done || snapshot.hasData) {
                              List<String> data = snapshot.data;
                              return CustomDropDownButton(txt: 'Achievements', fields: data, filter: false);
                            }
                            return const CircularProgressIndicator();
                        },
                      ),                   
                      const SizedBox(height: 20.0),
                      FutureBuilder(
                        future: obj.getTechStackList(),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
                            if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                              //return const Text("Something went wrong");
                            }
                            if (snapshot.connectionState == ConnectionState.done || snapshot.hasData) {
                              List<String> data = snapshot.data;
                              return CustomDropDownButton(txt: 'Tech-Stack', fields: data, filter: false);
                            }
                            return const CircularProgressIndicator();
                        },
                      ),                  
                      const SizedBox(height: 20.0),   
                      FutureBuilder(
                        future: obj.getAskMeAboutList(),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
                            if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                              //return const Text("Something went wrong");
                            }
                            if (snapshot.connectionState == ConnectionState.done || snapshot.hasData) {
                              List<String> data = snapshot.data;
                              return CustomDropDownButton(txt: 'Ask Me About', fields: data, filter: false);
                            }
                            return const CircularProgressIndicator();
                        },
                      ),                 
                      const SizedBox(height: 20.0),
                      const CustomTextField(txt: 'LinkedIn Profile', password: false,),
                      const SizedBox(height: 20.0),
                      const CustomTextField(txt: 'Github Profile', password: false,),
                      const SizedBox(height: 20.0),
                      SignInButton(txt: 'Create Account', cxt: context),
                    ],
                  )
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}


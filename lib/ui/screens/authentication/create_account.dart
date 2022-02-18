import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/ui/config/constants/colors.dart';
import '../../widgets/authentication/custom_text_field.dart';
import '../../widgets/common/drop_down_button.dart';
import '../../../data/common/filter_repository.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({ Key? key }) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  
  FilterRepository obj = FilterRepository();
  
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      //CustomDropDownButton(txt: 'Course', fields: _courseList, filter: false),
                      FutureBuilder(
                        future: obj.getCourseList(),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
                            if (snapshot.hasError) {
                              return const Text("Something went wrong");
                            }

                            if (snapshot.connectionState == ConnectionState.done || snapshot.hasData) {
                              List<String> data = snapshot.data();
                              return CustomDropDownButton(txt: 'Course', fields: data, filter: false);
                            }

                            return const CircularProgressIndicator();
                        },
                      ),
                      const SizedBox(height: 20.0),
                      //CustomDropDownButton(txt: 'Branch', fields: await obj.getBranchList('Branch'), filter: false),
                      const SizedBox(height: 20.0),
                      //CustomDropDownButton(txt: 'Year', fields: await obj.getYearList('Year'), filter: false),
                      const SizedBox(height: 20.0),
                      //CustomDropDownButton(txt: 'Company', fields: await obj.getCompanyList('Company'), filter: false),                    
                      const SizedBox(height: 20.0),
                      //const CustomTextField(txt: 'Experience', password: false,),
                      const SizedBox(height: 20.0),
                      //CustomDropDownButton(txt: 'Achievements', fields: await obj.getAchievementsList('Achievements'), filter: false),                    
                      const SizedBox(height: 20.0),
                      //CustomDropDownButton(txt: 'TechStack', fields: await obj.getTechStackList('TechStack'), filter: false),                    
                      const SizedBox(height: 20.0),
                      //CustomDropDownButton(txt: 'Ask Me About', fields: await obj.getAskMeABoutList('AskMeAbout'), filter: false),                    
                      const SizedBox(height: 20.0),
                      const CustomTextField(txt: 'LinkedIn Profile', password: false,),
                      const SizedBox(height: 20.0),
                      const CustomTextField(txt: 'Github Profile', password: false,),
                    ],
                  )
                ),
              ],
            ),
          ),
        )
    );
  }
}


/*
FutureBuilder(
                        future: obj.getCourseList('Course'),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) async{ 
                            switch(snapshot.connectionState)
                            {
                              case ConnectionState.none : return const Text('none');
                              case ConnectionState.waiting : return const Text('waiting');
                              case ConnectionState.active : return const Text('active');
                              case ConnectionState.done : return CustomDropDownButton(txt: 'Course', fields: await obj.getCourseList('Course'), filter: false);
                              default : return const Text('loading');
                            }
                        },
                      ),
*/
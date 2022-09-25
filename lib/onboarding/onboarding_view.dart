import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/common/role_selection_view.dart';
import 'package:nanny_co/constants.dart';

class onboarding_view extends StatefulWidget {
  const onboarding_view({Key, key}) : super(key: key);

  @override
  _onboarding_viewState createState() => _onboarding_viewState();
}

class _onboarding_viewState extends State<onboarding_view> {
  PageController controller=new PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: controller,
      children: [Column(
        children: [
          page1(),
          SizedBox(height:sh*0.1,),
          Container(
            width: sw*0.3,
            child: ElevatedButton(onPressed: (){
              setState(() {
                controller.nextPage(duration: Duration(seconds: 1), curve: Curves.easeIn);
              });
            },
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                child:Center(
                  child: Text(
                    'next',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                )),
          )
        ],
      ), Column(
        children: [
          page2(),
          SizedBox(height:sh*0.1,),
          Container(
            width: sw*0.3,
            child: ElevatedButton(onPressed: (){
              setState(() {
                controller.nextPage(duration: Duration(seconds: 1), curve: Curves.easeIn);
              });
            },
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                child:Center(
                  child: Text(
                    'next',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                )),
          )
        ],
      ), Column(
        children: [
          page3(),
          SizedBox(height:sh*0.13,),
          Container(
            width: sw*0.3,
            child: ElevatedButton(onPressed: (){
              setState(() {
               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>role_selection_view()));
              });
            },
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                child:Center(
                  child: Text(
                    'next',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                )),
          )
        ],
      )],
    ));
  }
}

class page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 100,bottom: 30),
            height: sh * 0.4,
            width: sw * 0.8,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/page1.png'))),
          ),
          Text(
            'Your neighbour',
            style:
                GoogleFonts.raleway(color: Theme.of(context).primaryColor
                  ,
                fontSize: 30
                ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' is your ',
                style: GoogleFonts.raleway(
                    color: Theme.of(context).primaryColor  ,
                    fontSize: 30),
              ),
              Text(
                'nanny',
                style: GoogleFonts.raleway(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}

class page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 100,bottom: 30),
            height: sh * 0.4,
            width: sw * 0.8,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/page2.png'))),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Trust, Reliable',
                style: GoogleFonts.raleway(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold  ,
                    fontSize: 30
                ),
              ),
              Text(
                ' and',
                style: GoogleFonts.raleway(
                    color: Theme.of(context).primaryColor  ,
                    fontSize: 30),
              ),
            ],
          ),
          Text(
            'Secure',
            style: GoogleFonts.raleway(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold  ,
                fontSize: 30
            ),
          ),
        ]));
  }
}

class page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100,bottom: 40),
            height: sh * 0.4,
            width: sw * 0.8,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/page3.png'))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Manage',
                style: GoogleFonts.raleway(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold  ,
                    fontSize: 30
                ),
              ),
              Text(
                ' your ',
                style: GoogleFonts.raleway(
                    color: Theme.of(context).primaryColor  ,
                    fontSize: 30),
              ),
              Text(
                'time',
                style: GoogleFonts.raleway(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold  ,
                    fontSize: 30
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

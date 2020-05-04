import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:postgrad_tracker/Model/User.dart';



class MyWidget extends StatelessWidget {
  final String title;
  final String message;

  const MyWidget({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}

void main(){
//  Profile item = new Profile("Tshepang Motaung","1431795","1431795@students.wits.ac.za",
//      "Honours", "01-02-2007", "Full year");
  final User user =new User();

  group('All input feild and button widgets should be on screen', ()
  {
//    testWidgets(
//        'Students Profile - Name', (WidgetTester tester) async {
//      await tester.pumpWidget(MyWidget(title: 'Name', message: 'StudentsName'));
//      final titleFinder = find.text('Name');
//      final messageFinder = find.text('StudentsName');
//
//      expect(titleFinder, findsOneWidget);
//      expect(messageFinder, findsOneWidget);
//    });
//
//    testWidgets(
//        'Students Profile - StudentNo', (WidgetTester tester) async {
//      await tester.pumpWidget(MyWidget(title: 'StudentNumber', message: '1431795'));
//      final titleFinder = find.text('StudentNumber');
//      final messageFinder = find.text('1431795');
//
//      expect(titleFinder, findsOneWidget);
//      expect(messageFinder, findsOneWidget);
//    });
//
//    testWidgets(
//        'Students Profile - StudentEmail', (WidgetTester tester) async {
//      await tester.pumpWidget(MyWidget(title: 'email', message: 'tshepang@gmail.com'));
//      final titleFinder = find.text('email');
//      final messageFinder = find.text('tshepang@gmail.com');
//
//      expect(titleFinder, findsOneWidget);
//      expect(messageFinder, findsOneWidget);
//    });
//
//    testWidgets(
//        'Students Profile - Degree', (WidgetTester tester) async {
//      await tester.pumpWidget(MyWidget(title: 'DegreeType', message: 'Degree'));
//      final titleFinder = find.text('DegreeType');
//      final messageFinder = find.text('Degree');
//
//      expect(titleFinder, findsOneWidget);
//      expect(messageFinder, findsOneWidget);
//    });
//
//    testWidgets(
//        'Students Profile - DateOfRegistration', (WidgetTester tester) async {
//      await tester.pumpWidget(MyWidget(title: 'DateOfRegistration', message: 'DOR'));
//      final titleFinder = find.text('DateOfRegistration');
//      final messageFinder = find.text('DOR');
//
//      expect(titleFinder, findsOneWidget);
//      expect(messageFinder, findsOneWidget);
//    });

    test("all fields should be assigned values", (){
     expect(user.firstname, null);
     expect(user.lastname, null);
     expect(user.studentNo, null);
     expect(user.email, null);
     expect(user.degree, null);
     expect(user.dateOfRegistration, null);
     expect(user.degreeType, null);
   });

    test('studentName', () {
      user.firstname='Tshepang';
      expect(user.firstname, 'Tshepang');
    });

    test('studentLastName', () {
      user.lastname='Motaung';
      expect(user.lastname, 'Motaung');
    });

    test('studentNo', () {
      user.studentNo='1431795';
      expect(user.studentNo, '1431795');
    });

    test('studentEmail', () {
      user.email='1431795@students.wits.ac.za';
      expect(user.email, '1431795@students.wits.ac.za');
    });

    test('degree', () {
      user.degree='Honours';
      expect(user.degree, 'Honours');
    });

    test('dateOfRegistration', () {
      user.dateOfRegistration='01-02-2007';
      expect(user.dateOfRegistration, '01-02-2007');
    });

    test('degreeType', () {
      user.degreeType='Full-Time';
      expect(user.degreeType, 'Full-Time');
    });







//   test("all fields should be assigned values", (){
//     expect(item.name, "Tshepang Motaung");
//     expect(item.studentNo, "1431795");
//     expect(item.email, "1431795@students.wits.ac.za");
//     expect(item.degree, "Honours");
//     expect(item.dateOfRegistration, "01-02-2007");
//     expect(item.degreeType, "Full year");
//   });

//   test('map creation from profile object', (){
//     item = new Profile("Tshepang","Motaung","StudentNumber", "StudentEmail","DegreeType",
//     "DateOfRegistration","DegreeType");
//
//     var map= Map<String, dynamic>();
//     map['name']="Tshepang";
//     map['surname']="Motaung";
//     map['studentNo']="1431795";
//     map['email']="1431795@students.wits.ac.za";
//     map['degree']="Honours";
//     map['dateOfRegistration']="01-02-2007";
//     map['degreeType']='Full year';
//   });



  });

}
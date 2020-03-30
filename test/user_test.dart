import 'package:flutter_test/flutter_test.dart';
import 'package:postgrad_tracker/user.dart';

void main(){

  group('User',(){
    final user=new User();

    test("getter and setter methods", (){
      user.uid="1";
      expect(user.uid,"1");

      user.firstname="Tshepo";
      expect(user.firstname, "Tshepo");

      user.lastname="Nkambule";
      expect(user.lastname, "Nkambule");

      //TODO carry on in a simlar way skaps and refactor code

    });

  });

}
import 'package:flutter_test/flutter_test.dart';
import 'package:postgrad_tracker/user.dart';

void main(){

  group('User',(){
    final user=new User();

    test("getter and setter methods", (){
      user.uid="1";
      expect(user.uid,"1");

      user.firstname="Tshepang";
      expect(user.firstname, "Tshepang");

      user.lastname="Motaung";
      expect(user.lastname, "Motaung");

      user.email="tshepangmotaung97@gmail.com";
      expect(user.email, "tshepangmotaung97@gmail.com");

      

      //TODO carry on in a simlar way skaps and refactor code

    });

  });

}

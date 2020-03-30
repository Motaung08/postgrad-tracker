import 'package:flutter_test/flutter_test.dart';
import 'package:postgrad_tracker/StudentRegister.dart';

import '../lib/user.dart';

void main(){
  final User user = new User();
  group('User', (){
    test('all fields should be null', (){
      expect(user.firstname, null);
      expect(user.lastname, null);
      expect(user.email, null);
      expect(user.studenNo, null);

    });

    test('username should have assigned value', (){
      user.email="tshepangmotaung97@gmail.com";
      expect(user.email, "tshepangmotaung97@gmail.com");
    });

    test('username should have assigned value', (){
      user.firstname="Tshepang";
      expect(user.firstname, "Tshepang");
    });

    test('username should have assigned value', (){
      user.lastname="Motaung";
      expect(user.lastname, "Motaung");
    });

    test('username should have assigned value', (){
      user.studenNo="1431795";
      expect(user.studenNo, "1431795");
    });



    
  });
  
  
  
}
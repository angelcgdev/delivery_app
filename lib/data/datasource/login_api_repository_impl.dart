import 'package:delivery_app/data/datasource/exception/auth_exception.dart';
import 'package:delivery_app/domain/model/user.dart';
import 'package:delivery_app/domain/repository/login_api_repository.dart';
import 'package:delivery_app/domain/response/login_response.dart';
import 'package:delivery_app/domain/request/login_request.dart';

class LoginApiRepositoryImpl extends LoginApiReapositoryInterface{
  @override
  Future<User> getUserFromToken(String token) async{
    if(token == 'aaaaaa'){
      return User(name: 'John Doe', username: 'johndoe@mail.com', image: 'assets/delivery/users/user1.jpg');
    } else if (token == 'bbbbbb'){
      return User(name: 'Jane Doe', username: 'janedoe@mail.com', image: 'assets/delivery/users/user2.jpg');
    }
    throw const AuthException('user not found');
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async{
    await Future.delayed(const Duration(seconds: 2));
    if(login.username == 'johndoe@mail.com' && login.password == '123456') {
      return LoginResponse(
        'aaaaaa',
        User(
          name: 'John Doe',
          username: 'johndoe@mail.com',
          image: 'assets/delivery/users/user1.jpg'
        )
      );
    }
    else if(login.username == 'janedoe@mail.com' && login.password == '123456') {
      return LoginResponse(
        'bbbbbb', 
        User(
          name: 'Jane Doe',
          username: 'janedoe@mail.com',
          image: 'assets/delivery/users/user2.jpg'
        )
      );
    }else{
      throw const AuthException('user not found');
    }
  }

  @override
  Future<void> logout(String token) async{
    print('remove token from server');
    return;
  }

}
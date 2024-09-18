
class UserRepository {
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
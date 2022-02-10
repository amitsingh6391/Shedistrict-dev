import 'package:dartz/dartz.dart';

//validator for maxstringlength

Either<String, String> validateMaxStringLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left("your input length is large");
  }
}

//validator to check our input is not empty:

Either<String, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left("Input should not be empty");
  }
}

//validatro to check a valid phone number;

Either<String, String> validatePhoneNumber(String input) {
  const phoneRegex = r"^[6-9]\d{9}$";
  if (RegExp(phoneRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left("invalid phone Number");
  }
}

//validtor for email address we are using "REGex" for this ;

Either<String, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left("Invalid Email");
  }
}

//validate videoUrl to check we are using valid url or not ;

Either<String, String> validateVideoUrl(String input) {
  const videoRegex =
      r"""^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)(\S+)?$""";

  if (RegExp(videoRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left("invalid video url");
  }
}

//validator for hexcolor code to verfiry we are using correct hexcode ;

Either<String, String> validateColorCode(String input) {
  if (input.length == 10) {
    return right(input);
  } else {
    return left(
      "invalid Color Code",
    );
  }
}

//validator for password to check user did not input too short password;

Either<String, String> validatePassword(String input) {
  if (input.length > 6) {
    return right(input);
  } else {
    return left("your password is too short");
  }
}

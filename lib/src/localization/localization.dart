import 'package:get/get.dart';
import 'package:servy_app/src/utils/constants/texts.dart';
import 'package:servy_app/src/utils/constants/texts_arabic.dart';

class MyLocal implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        //! Arabic
        'ar': {
          //?login &  signUp

          'loginTitle': TTextAr.loginTitle,
          'loginSubTitle': TTextAr.loginSubTitle,
          'email': TTextAr.email,
          'password': TTextAr.password,
          'rememberMe': TTextAr.rememberMe,
          'forgetPassword': TTextAr.forgetPassword,
          'signIn': TTextAr.signIn,
          'createAccount': TTextAr.createAccount,
          'orSignInWith': TTextAr.orSignInWith,
          'signUpTitle': TTextAr.signUpTitle,
          'firstName': TTextAr.firstName,
          'lastName': TTextAr.lastName,
          'userName': TTextAr.userName,
          'phoneNumber': TTextAr.phoneNo,
          'orSignUpWith': TTextAr.orSignUpWith,
          'iAgreeTo': TTextAr.iAgreeTo,
          'privacyPolicy': TTextAr.privacyPolicy,
          'and': TTextAr.and,
          'termsOfUse': TTextAr.termsOfUse,
          //?forget password

          'forgetPasswordTitle': TTextAr.forgetPasswordTitle,
          'forgetPasswordSubTitle': TTextAr.forgetPasswordSubTitle,
          'submit': TTextAr.submit,

          //?Home
          'homeAppbarTitle': TTextAr.homeAppbarTitle,
          'searchContainer': TTextAr.searchContainer,
          'popularCategories': TTextAr.popularCategories,
          'recommendationForYou': TTextAr.recommendationForYou,

          //?Home Categories
          'programming': TTextAr.programming,
          'digitalMarketing': TTextAr.digitalMarketing,
          'design': TTextAr.design,
          'videoEditing': TTextAr.videoEditing,
          'audiosEditing': TTextAr.audiosEditing,
          'writing': TTextAr.writing,
          'translation': TTextAr.translation,
          'engineeringArchitecture': TTextAr.engineeringArchitecture,

          //?Navigation menu
          'home': TTextAr.home,
          'chat': TTextAr.chat,
          'add': TTextAr.add,
          'brokers': TTextAr.brokers,
          'profile': TTextAr.profile,

          //?Brokers page
          'brokersSearchContainer': TTextAr.brokersSearchContainer,
          'brokersTitle': TTextAr.brokersTitle,
          'forMoreDetails': TTextAr.forMoreDetails,
          'clickHere': TTextAr.clickHere,
        },

        //? ///////////////////////////////////////////////////////////

        //! English
        'en': {
          //?login &  signUp
          'loginTitle': TText.loginTitle,
          'loginSubTitle': TText.loginSubTitle,
          'email': TText.email,
          'password': TText.password,
          'rememberMe': TText.rememberMe,
          'forgetPassword': TText.forgetPassword,
          'signIn': TText.signIn,
          'createAccount': TText.createAccount,
          'orSignInWith': TText.orSignInWith,
          'signUpTitle': TText.signUpTitle,
          'firstName': TText.firstName,
          'lastName': TText.lastName,
          'userName': TText.userName,
          'phoneNumber': TText.phoneNo,
          'orSignUpWith': TText.orSignUpWith,
          'iAgreeTo': TText.iAgreeTo,
          'privacyPolicy': TText.privacyPolicy,
          'and': TText.and,
          'termsOfUse': TText.termsOfUse,

          //?forget password
          'forgetPasswordTitle': TText.forgetPasswordTitle,
          'forgetPasswordSubTitle': TText.forgetPasswordSubTitle,
          'submit': TText.submit,

          //?Home
          'homeAppbarTitle': TText.homeAppbarTitle,
          'searchContainer': TText.searchContainer,
          'popularCategories': TText.popularCategories,
          'recommendationForYou': TText.recommendationForYou,

          //?Home Categories
          'programming': TText.programming,
          'digitalMarketing': TText.digitalMarketing,
          'design': TText.design,
          'videoEditing': TText.videoEditing,
          'audiosEditing': TText.audiosEditing,
          'writing': TText.writing,
          'translation': TText.translation,
          'engineeringArchitecture': TText.engineeringArchitecture,

          //?Navigation menu
          'home': TText.home,
          'chat': TText.chat,
          'add': TText.add,
          'brokers': TText.brokers,
          'profile': TText.profile,

          //?Brokers page
          'brokersSearchContainer': TText.brokersSearchContainer,
          'brokersTitle': TText.brokersTitle,
          'forMoreDetails': TText.forMoreDetails,
          'clickHere': TText.clickHere,
        },
      };
}

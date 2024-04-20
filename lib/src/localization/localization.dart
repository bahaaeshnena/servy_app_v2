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

          //?Details Brokers page
          'detailsBrokers': TTextAr.detailsBrokers,
          'titleBrokers1': TTextAr.titleBrokers1,
          'subTitle1': TTextAr.subTitle1,
          'titleBrokers2': TTextAr.titleBrokers2,
          'subTitle2': TTextAr.subTitle2,
          'titleBrokers3': TTextAr.titleBrokers3,
          'subTitle3': TTextAr.subTitle3,
          'title4': TTextAr.titleBrokers4,
          'subTitle4': TTextAr.subTitle4,
          'title5': TTextAr.titleBrokers5,
          'subTitle5': TTextAr.subTitle5,

          //?Profile Page
          'account': TText.account,

          'accountSettings': TTextAr.accountSettings,
          'titleOption1': TTextAr.titleOption1,
          'subTitleOption1': TTextAr.subTitleOption1,
          'titleOption2': TTextAr.titleOption2,
          'subTitleOption2': TTextAr.subTitleOption2,
          'titleOption3': TTextAr.titleOption3,
          'subTitleOption3': TTextAr.subTitleOption3,
          'titleOption4': TTextAr.titleOption4,
          'subTitleOption4': TTextAr.subTitleOption4,

          'appPage': TTextAr.appPage,
          'titleOption5': TTextAr.titleOption5,
          'subTitleOption5': TTextAr.subTitleOption5,
          'titleOption6': TTextAr.titleOption6,
          'subTitleOption6': TTextAr.subTitleOption6,

          'appSettings': TTextAr.appSettings,
          'titleOption7': TTextAr.titleOption7,
          'subTitleOption7': TTextAr.subTitleOption7,
          'titleOption8': TTextAr.titleOption8,
          'subTitleOption8': TTextAr.subTitleOption8,
          'titleOption9': TTextAr.titleOption9,
          'subTitleOption9': TTextAr.subTitleOption9,
          'titleOption10': TTextAr.titleOption10,
          'subTitleOption10': TTextAr.subTitleOption10,
          'logout': TTextAr.logout,

          //?Become our broker Page
          'becomeOurBroker': TTextAr.becomeOurBroker,
          'description': TTextAr.description,
          'subDescription': TTextAr.subDescription,
          'howItWorks': TTextAr.howItWorks,
          'subHowItWorks': TTextAr.subHowItWorks,
          'profitMechanism': TTextAr.profitMechanism,
          'subProfitMechanism': TTextAr.subProfitMechanism,
          'submissionToBroker': TTextAr.submissionToBroker,
          'subSubmissionToBroker': TTextAr.subSubmissionToBroker,
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

          //?Details Brokers page
          'detailsBrokers': TText.detailsBrokers,
          'titleBrokers1': TText.titleBrokers1,
          'subTitle1': TText.subTitle1,
          'titleBrokers2': TText.titleBrokers2,
          'subTitle2': TText.subTitle2,
          'titleBrokers3': TText.titleBrokers3,
          'subTitle3': TText.subTitle3,
          'title4': TText.titleBrokers4,
          'subTitle4': TText.subTitle4,
          'title5': TText.titleBrokers5,
          'subTitle5': TText.subTitle5,

          //?Profile Page
          'account': TText.account,

          'accountSettings': TText.accountSettings,
          'titleOption1': TText.titleOption1,
          'subTitleOption1': TText.subTitleOption1,
          'titleOption2': TText.titleOption2,
          'subTitleOption2': TText.subTitleOption2,
          'titleOption3': TText.titleOption3,
          'subTitleOption3': TText.subTitleOption3,
          'titleOption4': TText.titleOption4,
          'subTitleOption4': TText.subTitleOption4,

          'appPage': TText.appPage,
          'titleOption5': TText.titleOption5,
          'subTitleOption5': TText.subTitleOption5,
          'titleOption6': TText.titleOption6,
          'subTitleOption6': TText.subTitleOption6,

          'appSettings': TText.appSettings,
          'titleOption7': TText.titleOption7,
          'subTitleOption7': TText.subTitleOption7,
          'titleOption8': TText.titleOption8,
          'subTitleOption8': TText.subTitleOption8,
          'titleOption9': TText.titleOption9,
          'subTitleOption9': TText.subTitleOption9,
          'titleOption10': TText.titleOption10,
          'subTitleOption10': TText.subTitleOption10,
          'logout': TText.logout,

          //?Become our broker Page
          'becomeOurBroker': TText.becomeOurBroker,
          'description': TText.description,
          'subDescription': TText.subDescription,
          'howItWorks': TText.howItWorks,
          'subHowItWorks': TText.subHowItWorks,
          'profitMechanism': TText.profitMechanism,
          'subProfitMechanism': TText.subProfitMechanism,
          'submissionToBroker': TText.submissionToBroker,
          'subSubmissionToBroker': TText.subSubmissionToBroker,
        },
      };
}

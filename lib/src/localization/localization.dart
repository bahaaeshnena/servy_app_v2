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

          //?Setting Page
          'account': TTextAr.account,
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

          //? delete account & close & favoritePage
          'favourite': TTextAr.favourite,
          'messageDeleteAccount': TTextAr.messageDeleteAccount,
          'logoutAccount': TTextAr.logoutAccount,
          'messageLogout': TTextAr.messageLogout,
          'close': TTextAr.close,
          'cancel': TTextAr.cancel,
          'delete': TTextAr.delete,

          //? Contact Support
          'contactSupport': TTextAr.contactSupport,
          'titleContactSupport': TTextAr.titleContactSupport,
          'whatsApp': TTextAr.whatsApp,

          //? Privacy Policy
          'p1': TTextAr.p1,
          'p2': TTextAr.p2,
          'p3': TTextAr.p3,
          'p4': TTextAr.p4,
          'p5': TTextAr.p5,
          'p6': TTextAr.p6,
          'p7': TTextAr.p7,
          'p8': TTextAr.p8,
          'p9': TTextAr.p9,
          'p10': TTextAr.p10,
          'p11': TTextAr.p11,
          'p12': TTextAr.p12,
          'p13': TTextAr.p13,
          'p14': TTextAr.p14,
          'p15': TTextAr.p15,
          'p16': TTextAr.p16,
          'p17': TTextAr.p17,
          'p18': TTextAr.p18,
          'p19': TTextAr.p19,

          //? Profile Page
          'changePicture': TTextAr.changePicture,
          'profileInformation': TTextAr.profileInformation,
          'personalInformation': TTextAr.personalInformation,
          'userId': TTextAr.userId,
          'skillsInformation': TTextAr.skillsInformation,
          'gender': TTextAr.gender,
          'country': TTextAr.country,
          'skill': TTextAr.skill,
          'name': TTextAr.name,

          //? profile Information Page
          'changeName': TTextAr.changeName,
          'titleChangeName': TTextAr.titleChangeName,
          'save': TTextAr.save,

          //? Personal Information Page
          'changePhoneNumber': TTextAr.changePhoneNumber,
          'titleChangePhoneNumber': TTextAr.titleChangePhoneNumber,
          'changeGender': TTextAr.changeGender,
          'titleChangeGenderr': TTextAr.titleChangeGenderr,
          'changeCountry': TTextAr.changeCountry,
          'titleChangeCountry': TTextAr.titleChangeCountry,
          'copy': TTextAr.copy,

          //?skills Information Page
          'changeSkill': TTextAr.changeSkill,
          'titleChangeSkill': TTextAr.titleChangeSkill,

          //?Language Page
          'changeLanguage': TTextAr.changeLanguage,
          'titleChangeLanguage': TTextAr.titleChangeLanguage,
          'subTitleChangeLanguage': TTextAr.subTitleChangeLanguage,

          //?Add Page
          'addService': TTextAr.addService,
          'addImageService': TTextAr.addImageService,
          'titleServise': TTextAr.titleServise,
          'descriptionService': TTextAr.descriptionService,
          'priceFrom': TTextAr.priceFrom,
          'activateServiceOption': TTextAr.activateServiceOption,
          'correspondingService': TTextAr.correspondingService,
          'descriptioncorrespondingService':
              TTextAr.descriptioncorrespondingService,
          'publish': TTextAr.publish,
          'activateDescounts': TTextAr.activateDescounts,
          'priceFromDiscount': TTextAr.priceFromDiscount,

          'informationsService': TTextAr.informationsService,
          'selectCategories': TTextAr.selectCategories,
          'categories': TTextAr.categories,
          'clear': TTextAr.clear,
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

          //?Setting Page
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

          //? delete account & close & favoritePage
          'favourite': TText.favourite,
          'messageDeleteAccount': TText.messageDeleteAccount,
          'logoutAccount': TText.logoutAccount,
          'messageLogout': TText.messageLogout,
          'close': TText.close,
          'cancel': TText.cancel,
          'delete': TText.delete,

          //? Contact Support
          'contactSupport': TText.contactSupport,
          'titleContactSupport': TText.titleContactSupport,
          'whatsApp': TText.whatsApp,

          //? Privacy Policy
          'p1': TText.p1,
          'p2': TText.p2,
          'p3': TText.p3,
          'p4': TText.p4,
          'p5': TText.p5,
          'p6': TText.p6,
          'p7': TText.p7,
          'p8': TText.p8,
          'p9': TText.p9,
          'p10': TText.p10,
          'p11': TText.p11,
          'p12': TText.p12,
          'p13': TText.p13,
          'p14': TText.p14,
          'p15': TText.p15,
          'p16': TText.p16,
          'p17': TText.p17,
          'p18': TText.p18,
          'p19': TText.p19,

          //? Profile Page
          'changePicture': TText.changePicture,
          'profileInformation': TText.profileInformation,
          'personalInformation': TText.personalInformation,
          'userId': TText.userId,
          'skillsInformation': TText.skillsInformation,
          'gender': TText.gender,
          'country': TText.country,
          'skill': TText.skill,
          'name': TText.name,

          //? profile Information Page
          'changeName': TText.changeName,
          'titleChangeName': TText.titleChangeName,
          'save': TText.save,

          //? Personal Information Page
          'changePhoneNumber': TText.changePhoneNumber,
          'titleChangePhoneNumber': TText.titleChangePhoneNumber,
          'changeGender': TText.changeGender,
          'titleChangeGenderr': TText.titleChangeGenderr,
          'changeCountry': TText.changeCountry,
          'titleChangeCountry': TText.titleChangeCountry,
          'copy': TText.copy,

          //?skills Information Page
          'changeSkill': TText.changeSkill,
          'titleChangeSkill': TText.titleChangeSkill,

          //?Language Page
          'changeLanguage': TText.changeLanguage,
          'titleChangeLanguage': TText.titleChangeLanguage,
          'subTitleChangeLanguage': TText.subTitleChangeLanguage,

          //?Add Page
          'addService': TText.addService,
          'addImageService': TText.addImageService,
          'titleServise': TText.titleServise,
          'descriptionService': TText.descriptionService,
          'priceFrom': TText.priceFrom,
          'activateServiceOption': TText.activateServiceOption,
          'correspondingService': TText.correspondingService,
          'descriptioncorrespondingService':
              TText.descriptioncorrespondingService,
          'publish': TText.publish,
          'activateDescounts': TText.activateDescounts,
          'priceFromDiscount': TText.priceFromDiscount,

          'informationsService': TText.informationsService,
          'selectCategories': TText.selectCategories,
          'categories': TText.categories,
          'clear': TText.clear,

          //? Massages User
        },
      };
}

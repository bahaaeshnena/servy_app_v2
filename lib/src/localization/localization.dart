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
          'other': TTextAr.other,

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

          'adminOptions': TTextAr.adminOptions,
          'subTitleAdminOption6': TTextAr.subTitleAdminOption6,

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
          'descriptionProfile': TTextAr.descriptionProfile,
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
          'changeDescription': TTextAr.changeDescription,
          'titleChangeDescription': TTextAr.titleChangeDescription,
          'titleChangeCountry': TTextAr.titleChangeCountry,
          'changeCountry': TTextAr.changeCountry,
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

          //? my Service page
          'titleMyServiceScreen': TTextAr.titleMyServiceScreen,
          'edit': TTextAr.edit,
          'deleteService': TTextAr.deleteService,
          'messageDeleteService': TTextAr.messageDeleteService,
          'update': TTextAr.update,
          'updateService': TTextAr.updateService,
          'noServicesFound': TTextAr.noServicesFound,
          'youHaveNotPostedServices': TTextAr.youHaveNotPostedServices,

          //? onBoarding page
          'tOnBoardingTitle1': TTextAr.tOnBoardingTitle1,
          'tOnBoardingTitle2': TTextAr.tOnBoardingTitle2,
          'tOnBoardingTitle3': TTextAr.tOnBoardingTitle3,
          'tOnBoardingSubTitle1': TTextAr.tOnBoardingSubTitle1,
          'tOnBoardingSubTitle2': TTextAr.tOnBoardingSubTitle2,
          'tOnBoardingSubTitle3': TTextAr.tOnBoardingSubTitle3,

          //? //? Discount page
          'subTitleDiscountPage': TTextAr.subTitleDiscountPage,

          //? Detail service page
          'possibilityOfInterviewService':
              TTextAr.possibilityOfInterviewService,
          'rateService': TTextAr.rateService,
          'rate': TTextAr.rate,
          'pay': TTextAr.pay,
          'price': TTextAr.price,
          'titleDetailService': TTextAr.titleDetailService,

          //? Detail service page
          'userInformation': TTextAr.userInformation,
          'from': TTextAr.from,
          'seeAll': TTextAr.seeAll,
          'addComment': TTextAr.addComment,
          'reviewAndComments': TTextAr.reviewAndComments,
          'viewMyWorks': TTextAr.viewMyWorks,
          'noCommentsAvailable': TTextAr.noCommentsAvailable,
          'comment': TTextAr.comment,

          //? Categories page
          'subTitlePageCategoris': TTextAr.subTitlePageCategoris,

          //? Search page
          'noResultsFound': TTextAr.noResultsFound,

          //? Payment page
          'paymentPage': TTextAr.paymentPage,
          'cardNumber': TTextAr.cardNumber,
          'fullName': TTextAr.fullName,
          'mmyy': TTextAr.mmyy,
          'cvv': TTextAr.cvv,

          //? Admin option
          'adminOptionTitle': TTextAr.adminOptionTitle,
          'servicesDepartment': TTextAr.servicesDepartment,
          'servicesDepartmentTitle': TTextAr.servicesDepartmentTitle,
          'brokersDepartment': TTextAr.brokersDepartment,
          'brokersDepartmentTitle': TTextAr.brokersDepartmentTitle,
          'usersDepartment': TTextAr.usersDepartment,
          'noUserFound': TTextAr.noUserFound,
          'usersDepartmentTitle': TTextAr.usersDepartmentTitle,

          //? Services Department
          'pendingServices': TTextAr.pendingServices,
          'pendingServicesTitle': TTextAr.pendingServicesTitle,
          'dragServices': TTextAr.dragServices,
          'accepted': TTextAr.accepted,
          'reject': TTextAr.reject,
          'allUserServices': TTextAr.allUserServices,
          'allUserServicesTitle': TTextAr.allUserServicesTitle,

          //? Brokers Department
          'addingBrokers': TTextAr.addingBrokers,
          'addingBrokersTitle': TTextAr.addingBrokersTitle,
          'managementOfBrokers': TTextAr.managementOfBrokers,
          'managementOfBrokersTitle': TTextAr.managementOfBrokersTitle,

          //? adding broker
          'addingBrokersSubTitle': TTextAr.addingBrokersSubTitle,
          'age': TTextAr.age,
          'function': TTextAr.function,
          'addBrokerImage': TTextAr.addBrokerImage,

          //? management Of Brokers
          'managementOfBrokersError': TTextAr.managementOfBrokersError,
          'managementOfBrokersSubTitle': TTextAr.managementOfBrokersSubTitle,
          'managementOfBrokersDoneChat': TTextAr.managementOfBrokersDoneChat,

          //? Chat Page
          'chatPage': TTextAr.chatPage,
          'enterPersonEmail': TTextAr.enterPersonEmail,
          'createChat': TTextAr.createChat,
          'personEmail': TTextAr.personEmail,

          //? Messages
          //!User controller
          'success': TTextAr.success,
          'error': TTextAr.error,
          'successDeleteUser': TTextAr.successDeleteUser,
          'errorDeleteUser': TTextAr.errorDeleteUser,
          'congratulations': TTextAr.congratulations,
          'congratulationsMessage': TTextAr.congratulationsMessage,
          'ohSnap': TTextAr.ohSnap,
          'ohSnapMessage': TTextAr.ohSnapMessage,
          'dataNotSaved': TTextAr.dataNotSaved,
          'dataNotSavedMessage': TTextAr.dataNotSavedMessage,
          //! Service controller
          'successRating': TTextAr.successRating,
          'errorRating': TTextAr.errorRating,
          'failedRating': TTextAr.failedRating,
          'info': TTextAr.info,
          'successUpdate': TTextAr.successUpdate,
          'infoUpdate': TTextAr.infoUpdate,
          'errorUpdate': TTextAr.errorUpdate,
          'succesuccessDeletedss': TTextAr.successDeleted,
          'errorDeleted': TTextAr.errorDeleted,
          'showDeploy': TTextAr.showDeploy,
          'errorImage': TTextAr.errorImage,
          'validationError': TTextAr.validationError,
          'validationErrorMessage': TTextAr.validationErrorMessage,
          'postedService': TTextAr.postedService,
          //! chat controller
          'nouserfoundwiththisemail': TTextAr.nouserfoundwiththisemail,
          'createChatMessage': TTextAr.createChatMessage,
          //! comments controller
          'successComments': TTextAr.successComments,
          'errorComments': TTextAr.errorComments,
          //! brokers controller
          'successUpdateBroker': TTextAr.successUpdateBroker,
          'errorUpdateBroker': TTextAr.errorUpdateBroker,
          'postMessageBroker': TTextAr.postMessageBroker,
          //! SignUP controller
          'acceptPrivacyPolicy': TTextAr.acceptPrivacyPolicy,
          'acceptPrivacyPolicyMessage': TTextAr.acceptPrivacyPolicyMessage,
          'accountHasCreated': TTextAr.accountHasCreated,
          //! forget password controller
          'emailSent': TTextAr.emailSent,
          'emailSentMessage': TTextAr.emailSentMessage,
          //! verify email controller
          'verifyMessage': TTextAr.verifyMessage,
          //! update all controller
          'nameUpdate': TTextAr.nameUpdate,
          'phoneUpdate': TTextAr.phoneUpdate,
          'skillsUpdate': TTextAr.skillsUpdate,
          'countryUpdate': TTextAr.countryUpdate,
          'decUpdate': TTextAr.decUpdate,

          //? Validation
          'isRequired': TTextAr.isRequired,
          'emailIsRequired': TTextAr.emailIsRequired,
          'invalidEmailAddress': TTextAr.invalidEmailAddress,
          'passwordIsRequired': TTextAr.passwordIsRequired,
          'errorPassword': TTextAr.errorPassword,
          'errorPassword2': TTextAr.errorPassword2,
          'errorPassword3': TTextAr.errorPassword3,
          'errorPassword4': TTextAr.errorPassword4,
          'phoneIsRequired': TTextAr.phoneIsRequired,
          'errorPhone': TTextAr.errorPhone,
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
          'other': TText.other,

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

          'adminOptions': TText.adminOptions,
          'subTitleAdminOption6': TText.subTitleAdminOption6,

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
          'descriptionProfile': TText.descriptionProfile,
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
          'changeDescription': TText.changeDescription,
          'titleChangeDescription': TText.titleChangeDescription,

          'titleChangeCountry': TText.titleChangeCountry,
          'changeCountry': TText.changeCountry,
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

          //? my Service page
          'titleMyServiceScreen': TText.titleMyServiceScreen,
          'edit': TText.edit,
          'deleteService': TText.deleteService,
          'messageDeleteService': TText.messageDeleteService,
          'update': TText.update,
          'updateService': TText.updateService,
          'noServicesFound': TText.noServicesFound,
          'youHaveNotPostedServices': TText.youHaveNotPostedServices,

          //? onBoarding page
          'tOnBoardingTitle1': TText.tOnBoardingTitle1,
          'tOnBoardingTitle2': TText.tOnBoardingTitle2,
          'tOnBoardingTitle3': TText.tOnBoardingTitle3,
          'tOnBoardingSubTitle1': TText.tOnBoardingSubTitle1,
          'tOnBoardingSubTitle2': TText.tOnBoardingSubTitle2,
          'tOnBoardingSubTitle3': TText.tOnBoardingSubTitle3,

          //? Discount page
          'subTitleDiscountPage': TText.subTitleDiscountPage,

          //? Detail service page
          'possibilityOfInterviewService': TText.possibilityOfInterviewService,
          'rateService': TText.rateService,
          'rate': TText.rate,
          'pay': TText.pay,
          'price': TText.price,
          'titleDetailService': TText.titleDetailService,

          //? Detail service page
          'userInformation': TText.userInformation,
          'from': TText.from,
          'seeAll': TText.seeAll,
          'addComment': TText.addComment,
          'reviewAndComments': TText.reviewAndComments,
          'viewMyWorks': TText.viewMyWorks,
          'noCommentsAvailable': TText.noCommentsAvailable,
          'comment': TText.comment,

          //? Categories page
          'subTitlePageCategoris': TText.subTitlePageCategoris,

          //? Search page
          'noResultsFound': TText.noResultsFound,

          //? Payment page
          'paymentPage': TText.paymentPage,
          'cardNYmber': TText.cardNumber,
          'fullName': TText.fullName,
          'mmyy': TText.mmyy,
          'cvv': TText.cvv,

          //? Admin option
          'adminOptionTitle': TText.adminOptionTitle,
          'servicesDepartment': TText.servicesDepartment,
          'servicesDepartmentTitle': TText.servicesDepartmentTitle,
          'brokersDepartment': TText.brokersDepartment,
          'brokersDepartmentTitle': TText.brokersDepartmentTitle,
          'usersDepartment': TText.usersDepartment,
          'noUserFound': TText.noUserFound,
          'usersDepartmentTitle': TText.usersDepartmentTitle,

          //? Services Department
          'pendingServices': TText.pendingServices,
          'pendingServicesTitle': TText.pendingServicesTitle,
          'dragServices': TText.dragServices,
          'accepted': TText.accepted,
          'reject': TText.reject,
          'allUserServices': TText.allUserServices,
          'allUserServicesTitle': TText.allUserServicesTitle,

          //? Brokers Department
          'addingBrokers': TText.addingBrokers,
          'addingBrokersTitle': TText.addingBrokersTitle,
          'managementOfBrokers': TText.managementOfBrokers,
          'managementOfBrokersTitle': TText.managementOfBrokersTitle,

          //? adding broker
          'addingBrokersSubTitle': TText.addingBrokersSubTitle,
          'age': TText.age,
          'function': TText.function,
          'addBrokerImage': TText.addBrokerImage,

          //? management Of Brokers
          'managementOfBrokersError': TText.managementOfBrokersError,
          'managementOfBrokersSubTitle': TText.managementOfBrokersSubTitle,
          'managementOfBrokersDoneChat': TText.managementOfBrokersDoneChat,

          //? Chat Page
          'chatPage': TText.chatPage,
          'enterPersonEmail': TText.enterPersonEmail,
          'createChat': TText.createChat,
          'personEmail': TText.personEmail,

          //? Messages
          //!User controller
          'success': TText.success,
          'error': TText.error,
          'successDeleteUser': TText.successDeleteUser,
          'errorDeleteUser': TText.errorDeleteUser,
          'congratulations': TText.congratulations,
          'congratulationsMessage': TText.congratulationsMessage,
          'ohSnap': TText.ohSnap,
          'ohSnapMessage': TText.ohSnapMessage,
          'dataNotSaved': TText.dataNotSaved,
          'dataNotSavedMessage': TText.dataNotSavedMessage,
          //! Service controller
          'successRating': TText.successRating,
          'errorRating': TText.errorRating,
          'failedRating': TText.failedRating,
          'info': TText.info,
          'successUpdate': TText.successUpdate,
          'infoUpdate': TText.infoUpdate,
          'errorUpdate': TText.errorUpdate,
          'succesuccessDeletedss': TText.successDeleted,
          'errorDeleted': TText.errorDeleted,
          'showDeploy': TText.showDeploy,
          'errorImage': TText.errorImage,
          'validationError': TText.validationError,
          'validationErrorMessage': TText.validationErrorMessage,
          'postedService': TText.postedService,
          //! chat controller
          'nouserfoundwiththisemail': TText.nouserfoundwiththisemail,
          'createChatMessage': TText.createChatMessage,
          //! comments controller
          'successComments': TText.successComments,
          'errorComments': TText.errorComments,
          //! brokers controller
          'successUpdateBroker': TText.successUpdateBroker,
          'errorUpdateBroker': TText.errorUpdateBroker,
          'postMessageBroker': TText.postMessageBroker,
          //! SignUP controller
          'acceptPrivacyPolicy': TText.acceptPrivacyPolicy,
          'acceptPrivacyPolicyMessage': TText.acceptPrivacyPolicyMessage,
          'accountHasCreated': TText.accountHasCreated,
          //! forget password controller
          'emailSent': TText.emailSent,
          'emailSentMessage': TText.emailSentMessage,
          //! verify email controller
          'verifyMessage': TText.verifyMessage,
          //! update all controller
          'nameUpdate': TText.nameUpdate,
          'phoneUpdate': TText.phoneUpdate,
          'skillsUpdate': TText.skillsUpdate,
          'countryUpdate': TText.countryUpdate,
          'decUpdate': TText.decUpdate,

          //? Validation
          'isRequired': TText.isRequired,
          'emailIsRequired': TText.emailIsRequired,
          'invalidEmailAddress': TText.invalidEmailAddress,
          'passwordIsRequired': TText.passwordIsRequired,
          'errorPassword': TText.errorPassword,
          'errorPassword2': TText.errorPassword2,
          'errorPassword3': TText.errorPassword3,
          'errorPassword4': TText.errorPassword4,
          'phoneIsRequired': TText.phoneIsRequired,
          'errorPhone': TText.errorPhone,
        },
      };
}

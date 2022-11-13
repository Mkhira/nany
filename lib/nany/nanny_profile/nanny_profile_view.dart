
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nanny_co/common/role_selection_view.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/domain/config/setting_provider.dart';
import 'package:nanny_co/nany/nanny_bottombar_view/nanny_bottombar_view.dart';
import 'package:nanny_co/nany/nanny_drawer.dart/nanny_drawer_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';

import '../auth_view/Controller/Auth_controller.dart';

class NannyProfileView extends StatefulWidget {
  const NannyProfileView({Key? key}) : super(key: key);

  @override
  State<NannyProfileView> createState() => _NannyProfileViewState();
}

class _NannyProfileViewState extends State<NannyProfileView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // final nannyProfile_Controller profile_controller = Get.put(nannyProfile_Controller());
  @override
  void initState() {
    super.initState();
    // profile_controller.getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: nanny_drawer_view(),
        body: SizedBox(
            height: sh,
            width: sw,
            child: Stack(children: [
              Container(
                  height: sh * 0.35,
                  width: sw,
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                  child: const Icon(
                                    Icons.menu,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    NanyAuthController().signOut();
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const role_selection_view()));
                                  },
                                  child: const Icon(
                                    Icons.logout,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Profile ',
                                  style: GoogleFonts.raleway(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                const Image(image: AssetImage('assets/images/dots.png')),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Positioned(
                bottom: 0,
                child: Container(
                  height: sh * 0.71,
                  width: sw,
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 2),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          SettingsProvider.userData.image??'',
                                        ))),
                              ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                SettingsProvider.userData.fullName??'',
                                    style: GoogleFonts.raleway(
                                        color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                               Text(
                                SettingsProvider.userData.cityId.toString()??'',
                                    style: GoogleFonts.raleway(color: Colors.redAccent, fontSize: 12),
                                  ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 30,
                                child: ElevatedButton(
                                    onPressed: () {
                                      nanny_bottombar_viewState.selectedIndex = 4;
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(builder: (context) => const nanny_bottombar_view()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Theme.of(context).primaryColor,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000))),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
                                      child: Center(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.edit,
                                              size: 12,
                                            ),
                                            Text(
                                              ' Edit Profile',
                                              style: GoogleFonts.raleway(color: Colors.white, fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: sw,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              spreadRadius: 2,
                              blurRadius: 10,
                            )
                          ],
                          border: Border.all(
                            width: 5,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Phone',
                                        style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                                      ),
                                       Text(
                                        SettingsProvider.userData.phone??'',
                                            style: GoogleFonts.raleway(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                          ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Email',
                                        style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                                      ),
                                       Text(
                                        SettingsProvider.userData.email??'',
                                            style: GoogleFonts.raleway(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                          ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Birthday',
                                        style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                                      ),
                                       Text(
                                        DateFormat('yyyy-MM-dd').format(SettingsProvider.userData.dob!),
                                            style: GoogleFonts.raleway(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                          ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Gender',
                                        style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                                      ),
                                       Text(
                                        SettingsProvider.userData.gender??'',
                                            style: GoogleFonts.raleway(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                          ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Max Price',
                                        style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                                      ),
                                     Text(
                                            '${SettingsProvider.userData.minPrice} Riyal (Per Hour)',
                                            style: GoogleFonts.raleway(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),

                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Min Price',
                                        style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                                      ),
                                      Text(
                                            '${SettingsProvider.userData.minPrice} Riyal (Per Hour)',
                                            style: GoogleFonts.raleway(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),

                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: sw,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              spreadRadius: 2,
                              blurRadius: 10,
                            )
                          ],
                          border: Border.all(
                            width: 5,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address',
                              style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          Text(
                                  SettingsProvider.userData.address??'',
                                  maxLines: 10,
                                  style: GoogleFonts.raleway(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),

                            const Divider(
                              thickness: 2,
                            ),
                            Text(
                              'Education',
                              style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                             Text(
                                  SettingsProvider.userData.universityName??'',
                                  maxLines: 10,
                                  style: GoogleFonts.raleway(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),

                            const Divider(
                              thickness: 2,
                            ),
                            Text(
                              'Experience',
                              style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                           Text(
                                  SettingsProvider.userData.totalExperience.toString(),
                                  maxLines: 10,
                                  style: GoogleFonts.raleway(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),

                            const Divider(
                              thickness: 2,
                            ),
                            Text(
                              'Special Needs',
                              style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(SettingsProvider.userData.specialNeeds??'',
                                  maxLines: 10, style: GoogleFonts.raleway(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),

                            const Divider(
                              thickness: 2,
                            ),
                            Text(
                              'No. of Children Willing to care',
                              style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              SettingsProvider.userData.noOfChildren.toString(),
                              maxLines: 10,
                              style: GoogleFonts.raleway(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const Divider(
                              thickness: 2,
                            ),
                            Text(
                              'National Id',
                              style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                             Text(
                              SettingsProvider.userData.idNumber??'',
                                  maxLines: 10,
                                  style: GoogleFonts.raleway(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                            const Divider(
                              thickness: 2,
                            ),
                            Text(
                              'Sitter Type',
                              style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                             Text(
                              SettingsProvider.userData.sitterType??'',
                                  maxLines: 10,
                                  style: GoogleFonts.raleway(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Image Gallery',
                            style: GoogleFonts.raleway(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          // Visibility(
                          //   visible: profile_controller.nannyModel.value.gallery != null,
                          //   child: SizedBox(
                          //     height: 100,
                          //     child: Obx(() => profile_controller.nannyModel.value.gallery!.isNotEmpty
                          //         ? ListView.builder(
                          //             itemCount: profile_controller.nannyModel.value.gallery != null
                          //                 ? profile_controller.nannyModel.value.gallery!.length
                          //                 : 1,
                          //             padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          //             scrollDirection: Axis.horizontal,
                          //             itemBuilder: (context, index) {
                          //               return Padding(
                          //                 padding: const EdgeInsets.only(right: 8.0),
                          //                 child: Row(
                          //                   children: [
                          //                     Visibility(
                          //                       visible: index <= profile_controller.nannyModel.value.gallery!.length,
                          //                       child: Column(
                          //                         children: [
                          //                           Container(
                          //                             padding: const EdgeInsets.all(5),
                          //                             decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white, boxShadow: [
                          //                               BoxShadow(color: Colors.grey.shade300, spreadRadius: 3, blurRadius: 5)
                          //                             ]),
                          //                             child: Container(
                          //                               height: 70,
                          //                               width: 70,
                          //                               decoration: BoxDecoration(
                          //                                   shape: BoxShape.circle,
                          //                                   image: DecorationImage(
                          //                                       fit: BoxFit.fill,
                          //                                       image: NetworkImage(
                          //                                           '${profile_controller.nannyModel.value.gallery!.elementAt(index)}'))),
                          //                             ),
                          //                           ),
                          //                         ],
                          //                       ),
                          //                     ),
                          //                     Visibility(
                          //                       visible: profile_controller.nannyModel.value.gallery!.length == index + 1,
                          //                       child: Padding(
                          //                         padding: const EdgeInsets.symmetric(horizontal: 10),
                          //                         child: InkWell(
                          //                           onTap: () async {
                          //                             FilePickerResult? result =
                          //                                 await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false);
                          //                             if (result != null) {
                          //                               var file = result.files.single.path;
                          //                               var name = result.files.single.name;
                          //                               FirebaseStorage storage = FirebaseStorage.instance;
                          //                               Reference ref = storage.ref().child('profile_images/');
                          //                               await ref.putFile(File(file!));
                          //                               var upload = await ref.getDownloadURL();
                          //                               if (upload != null) {
                          //                                 FirebaseFirestore.instance
                          //                                     .collection('nanny')
                          //                                     .doc(FirebaseAuth.instance.currentUser!.uid)
                          //                                     .update({
                          //                                   'gallery': FieldValue.arrayUnion([upload])
                          //                                 });
                          //                                 profile_controller.getProfileData();
                          //                               }
                          //                             } else {
                          //                               // User canceled the picker
                          //                             }
                          //                           },
                          //                           child: Column(
                          //                             children: [
                          //                               Container(
                          //                                   height: 75,
                          //                                   width: 75,
                          //                                   padding: const EdgeInsets.all(5),
                          //                                   decoration: BoxDecoration(
                          //                                       shape: BoxShape.circle,
                          //                                       color: Colors.white,
                          //                                       boxShadow: [
                          //                                         BoxShadow(color: Colors.grey.shade300, spreadRadius: 3, blurRadius: 5)
                          //                                       ]),
                          //                                   child: const Center(
                          //                                     child: Icon(
                          //                                       Icons.add,
                          //                                       color: Colors.grey,
                          //                                     ),
                          //                                   )),
                          //                             ],
                          //                           ),
                          //                         ),
                          //                       ),
                          //                     )
                          //                   ],
                          //                 ),
                          //               );
                          //             })
                          //         : InkWell(
                          //             onTap: () async {
                          //               FilePickerResult? result =
                          //                   await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false);
                          //               if (result != null) {
                          //                 var file = result.files.single.path;
                          //                 var name = result.files.single.name;
                          //                 FirebaseStorage storage = FirebaseStorage.instance;
                          //                 Reference ref = storage.ref().child('profile_images/');
                          //                 await ref.putFile(File(file!));
                          //                 var upload = await ref.getDownloadURL();
                          //                 if (upload != null) {
                          //                   FirebaseFirestore.instance
                          //                       .collection('nanny')
                          //                       .doc(FirebaseAuth.instance.currentUser!.uid)
                          //                       .update({
                          //                     'gallery': FieldValue.arrayUnion([upload])
                          //                   });
                          //                   profile_controller.getProfileData();
                          //                 }
                          //               } else {
                          //                 // User canceled the picker
                          //               }
                          //             },
                          //             child: Column(
                          //               children: [
                          //                 Container(
                          //                     height: 75,
                          //                     width: 75,
                          //                     margin: const EdgeInsets.all(10),
                          //                     padding: const EdgeInsets.all(5),
                          //                     decoration: BoxDecoration(
                          //                         shape: BoxShape.circle,
                          //                         color: Colors.white,
                          //                         boxShadow: [BoxShadow(color: Colors.grey.shade300, spreadRadius: 3, blurRadius: 5)]),
                          //                     child: const Center(
                          //                       child: Icon(
                          //                         Icons.add,
                          //                         color: Colors.grey,
                          //                       ),
                          //                     )),
                          //               ],
                          //             ),
                          //           )),
                          //   ),
                          // ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Availability',
                            style: GoogleFonts.raleway(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // profile_controller.nannyModel.value.availability != null
                      //     ? SizedBox(
                      //         height: 150,
                      //         child: ListView.builder(
                      //             itemCount: profile_controller.nannyModel.value.availability!.length,
                      //             scrollDirection: Axis.horizontal,
                      //             itemBuilder: (context, index) {
                      //               return Stack(
                      //                 children: [
                      //                   Container(
                      //                       width: 150,
                      //                       margin: const EdgeInsets.all(10),
                      //                       decoration: BoxDecoration(
                      //                           border: Border.all(color: Colors.grey, width: 1), borderRadius: BorderRadius.circular(20)),
                      //                       child: Column(
                      //                         children: [
                      //                           Expanded(
                      //                             child: Container(
                      //                               padding: const EdgeInsets.all(10),
                      //                               decoration: const BoxDecoration(
                      //                                   color: Colors.white,
                      //                                   borderRadius:
                      //                                       BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                      //                               child: Column(
                      //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                                 crossAxisAlignment: CrossAxisAlignment.start,
                      //                                 children: [
                      //                                   Text(
                      //                                     '${profile_controller.nannyModel.value.availability!.elementAt(index).date}',
                      //                                     style: GoogleFonts.raleway(
                      //                                         color: Theme.of(context).primaryColor,
                      //                                         fontWeight: FontWeight.bold,
                      //                                         fontSize: 16),
                      //                                   ),
                      //                                   Text(
                      //                                     'Selected time    ',
                      //                                     style: GoogleFonts.raleway(color: Colors.grey.shade500, fontSize: 12),
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ),
                      //                           ),
                      //                           Expanded(
                      //                             child: Container(
                      //                               padding: const EdgeInsets.all(5),
                      //                               decoration: const BoxDecoration(
                      //                                   color: Colors.transparent,
                      //                                   borderRadius: BorderRadius.only(
                      //                                       bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
                      //                               child: Column(
                      //                                 children: [
                      //                                   Row(
                      //                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                                     children: [
                      //                                       Text(
                      //                                         '${profile_controller.nannyModel.value.availability!.elementAt(index).startTime}    ',
                      //                                         style: GoogleFonts.raleway(
                      //                                             color: Colors.grey.shade600, fontWeight: FontWeight.bold, fontSize: 16),
                      //                                       ),
                      //                                       Icon(
                      //                                         Icons.keyboard_arrow_down_sharp,
                      //                                         color: Colors.grey.shade600,
                      //                                       )
                      //                                     ],
                      //                                   ),
                      //                                   Row(
                      //                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                                     children: [
                      //                                       Text(
                      //                                         '${profile_controller.nannyModel.value.availability!.elementAt(index).startTime}    ',
                      //                                         style: GoogleFonts.raleway(
                      //                                             color: Colors.grey.shade600, fontWeight: FontWeight.bold, fontSize: 16),
                      //                                       ),
                      //                                       Icon(
                      //                                         Icons.keyboard_arrow_down_sharp,
                      //                                         color: Colors.grey.shade600,
                      //                                       )
                      //                                     ],
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ),
                      //                           )
                      //                         ],
                      //                       )),
                      //                   Positioned(
                      //                     right: 0,
                      //                     child: InkWell(
                      //                       onTap: () {},
                      //                       child: const Icon(
                      //                         Icons.check_circle,
                      //                         size: 30,
                      //                         color: Colors.green,
                      //                       ),
                      //                     ),
                      //                   )
                      //                 ],
                      //               );
                      //             }),
                      //       )
                      //     : Container(),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          NanyAuthController().signOut();
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ParentSignInView()));
                        },
                        child: Container(
                          width: sw,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                spreadRadius: 2,
                                blurRadius: 10,
                              )
                            ],
                            border: Border.all(
                              width: 5,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Logout',
                                maxLines: 10,
                                style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ]),
                  ),
                ),
              ),
            ])));
  }
}

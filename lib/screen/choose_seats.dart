import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import 'package:sinema_rezervasyon/base/provider.dart';
import 'package:sinema_rezervasyon/design/cinema_home_page.dart';

import 'package:sinema_rezervasyon/main.dart';

import 'package:sinema_rezervasyon/model/seats.dart';

import '../model/movie.dart';

class ChooseSeats extends StatefulWidget {
  final Movie movie;

  const ChooseSeats({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  _ChooseSeatsState createState() => _ChooseSeatsState();
}

class _ChooseSeatsState extends State<ChooseSeats> {
  final List<int> _selectedItems = [];

  String selectedSeatsText = "";
  final List<int> _constReserveSeats = [];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MovieProvider(),
        builder: (context, child) {
          movieProvider.movieList.toList().forEach((value) {
            value.name == widget.movie.name
                ? value.seats.toList().forEach((element) {
                    // _selectedItems
                    //     .add(SeatsList.instance.seats.indexOf(element));
                    _constReserveSeats
                        .add(SeatsList.instance.seats.indexOf(element));
                  })
                : null;
          });

          return Scaffold(
            backgroundColor: Colors.blue,
            appBar: AppBar(
              toolbarHeight: 100,
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text(
                "Koltuk Seçimi",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
              titleSpacing: 6,
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 420,
                    width: 350,
                    // transform: Matrix4.translationValues(25, 65, 1),
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(45)),
                    child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text("Ekran"),
                              SizedBox(
                                width: 250,
                                // transform: Matrix4.translationValues(0, 50, 1),
                                child: Divider(
                                  height: 10,
                                  color: Colors.black,
                                  thickness: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 10,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: GridView.count(
                              crossAxisSpacing: 20,
                              shrinkWrap: true,
                              crossAxisCount: 5,
                              mainAxisSpacing: 8,
                              childAspectRatio: 1,
                              children: List.generate(
                                  SeatsList.instance.seats.length, (index) {
                                return Center(
                                  child: Container(
                                    color: _constReserveSeats.contains(index)
                                        ? Colors.grey
                                        : _selectedItems.contains(index)
                                            ? Colors.red
                                            : Colors.blue,
                                    child: TextButton(
                                      onPressed: _constReserveSeats
                                              .contains(index)
                                          ? null
                                          : () {
                                              setState(() {
                                                if (_selectedItems
                                                        .contains(index) ==
                                                    false) {
                                                  _selectedItems.add(index);
                                                  selectedSeatsText = "";
                                                  _selectedItems
                                                      .toList()
                                                      .forEach((element) {
                                                    if (selectedSeatsText !=
                                                        "") {
                                                      selectedSeatsText +=
                                                          " , ";
                                                    }
                                                    selectedSeatsText +=
                                                        (SeatsList.instance
                                                            .seats[element]);
                                                  });
                                                } else {
                                                  _selectedItems.remove(index);
                                                  selectedSeatsText = "";
                                                  _selectedItems
                                                      .toList()
                                                      .forEach((element) {
                                                    if (selectedSeatsText !=
                                                        "") {
                                                      selectedSeatsText +=
                                                          " , ";
                                                    }
                                                    selectedSeatsText +=
                                                        (SeatsList.instance
                                                            .seats[element]);
                                                  });
                                                }
                                              });
                                            },
                                      child: Text(
                                        SeatsList.instance.seats[index],
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.green,
                      ),
                      child: TextButton(
                        child: const Text(
                          'Rezerve Et',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          _selectedItems.isEmpty
                              ? ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      action: SnackBarAction(
                                        label: "X",
                                        textColor: Colors.white,
                                        onPressed: () {},
                                      ),
                                      backgroundColor: Colors.red,
                                      dismissDirection: DismissDirection.up,
                                      content: const Text(
                                          "Lütfen Koltuk Seçimi Yapın...")))
                              : _buildShowModalBottomSheet(context);

                          // showDialog(
                          //   context: context,
                          //   builder: (_) => AlertDialog(
                          //       contentPadding:
                          //           EdgeInsets.only(bottom: 0, left: 5),
                          //       shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.all(
                          //               Radius.circular(32.0))),
                          //       actions: [
                          //         TextButton(
                          //           // textColor: Colors.pink,
                          //           onPressed: () => Navigator.pop(context),
                          //           child: Text('CLOSE'),
                          //         )
                          //       ],
                          //       insetPadding: EdgeInsets.symmetric(
                          //           horizontal: 40, vertical: 40),
                          //       title: Text("Rezervasyon Detayları",
                          //           textAlign: TextAlign.center,
                          //           style: GoogleFonts.poppins(
                          //               fontSize: 18,
                          //               fontWeight: FontWeight.w600,
                          //               color: Colors.pink)),
                          //       content: Container(
                          //         width: 100,
                          //         height: 100,
                          //         child: ListView(
                          //           children: [
                          //             Text("Film: ",
                          //                 style: GoogleFonts.poppins(
                          //                     fontSize: 17,
                          //                     fontWeight: FontWeight.w600,
                          //                     color: Colors.black)),
                          //             Text("Süre:  ",
                          //                 style: GoogleFonts.poppins(
                          //                     fontSize: 17,
                          //                     fontWeight: FontWeight.w600,
                          //                     color: Colors.black)),
                          //             // Text(
                          //             //     "Tarih:  " +
                          //             //         DateFormat.yMd()
                          //             //             .format(widget.chosen),
                          //             //     style: GoogleFonts.poppins(
                          //             //         fontSize: 17,
                          //             //         fontWeight: FontWeight.w600,
                          //             //         color: Colors.black)),
                          //             Text("Koltuklar:  " + selectedSeatsText,
                          //                 style: GoogleFonts.poppins(
                          //                     fontSize: 17,
                          //                     fontWeight: FontWeight.w600,
                          //                     color: Colors.black)),
                          //           ],
                          //         ),
                          //       )),
                          // );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  String? validateEmail(String? value) {
    if (value != null) {
      if (value.length > 5 && value.contains('@') && value.endsWith('.com')) {
        return null;
      }
      return 'Geçerli bir eposta adresi giriniz';
    }
    return null;
  }

  String? validateMobile(String? value) {
    if (value!.length != 11) {
      return 'Telefon numarınız 11 haneli olmalıdır';
    } else {
      return null;
    }
  }

  String? validateNameAndSurname(String? value, String type) {
    if (value!.isEmpty) {
      return 'Lütfen $type girin';
    } else {
      return null;
    }
  }

  TextEditingController dateinput = TextEditingController();
  String? validateDate(String? value) {
    if (value!.isEmpty) {
      return "Lütfen Tarih giriniz";
    }

    movieProvider.movieList.toList().forEach((value) {
      if (value.name == widget.movie.name) {
        DateTime movieAgebegin =
            DateTime(DateTime.now().year - value.ageLimit, 1, 1);

        String day = dateinput.text.substring(0, dateinput.text.indexOf("."));
        String month = dateinput.text.substring(
            dateinput.text.indexOf(".") + 1, dateinput.text.lastIndexOf("."));
        String year =
            dateinput.text.substring(dateinput.text.lastIndexOf(".") + 1);

        DateTime userDateTime =
            DateTime(int.parse(year), int.parse(month), int.parse(day));

        log(movieAgebegin.isBefore(userDateTime).toString());

        if (movieAgebegin.isBefore(userDateTime)) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
                contentPadding: const EdgeInsets.only(bottom: 0, left: 5),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Kapat'),
                  )
                ],
                insetPadding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                title: Text("Uyarı",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.pink)),
                content: SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Bu film yaşınıza uygun değildir!",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ),
                  ),
                )),
          );
        }
      }
    });

    // if (value!.isEmpty && ) {
    //   return
    // } else {
    //   return null;
    // }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height,
            color: bgColor,
            child: Center(
              child: Form(
                key: _formKey,
                // autovalidateMode: AutovalidateMode.always,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Spacer(
                        flex: 5,
                      ),
                      Text(
                        "Kayıt Formu",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      TextFormField(
                        validator: (value) {
                          return validateNameAndSurname(value, "adınızı");
                        },
                        decoration: _buildInputDecoration(
                            label: "Ad", hint: "Adınızı Giriniz"),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      TextFormField(
                        validator: (value) {
                          return validateNameAndSurname(value, "soyadınızı");
                        },
                        decoration: _buildInputDecoration(
                            label: "Soyad", hint: "Soyadınızı Giriniz"),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: validateEmail,
                        decoration: _buildInputDecoration(
                            label: "Eposta", hint: "Epostanızı giriniz"),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      TextFormField(
                        validator: validateMobile,
                        keyboardType: TextInputType.phone,
                        decoration: _buildInputDecoration(
                            label: "Telefon",
                            hint: "Telefon numarınızı giriniz"),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      TextFormField(
                        validator: validateDate,
                        keyboardType: TextInputType.datetime,
                        controller:
                            dateinput, //editing controller of this TextField
                        decoration: const InputDecoration(
                            icon:
                                Icon(Icons.calendar_today), //icon of text field
                            labelText:
                                "Doğum Tarihinizi Girin" //label text of field
                            ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1930),
                              lastDate: DateTime.now(),
                              initialDate: DateTime.now());

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('dd.MM.yyyy').format(pickedDate);

                            setState(() {
                              dateinput.text = formattedDate;
                            });
                          }
                        },
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: const Text('Onayla'),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _selectedItems.toList().forEach((element) {
                                  movieProvider.movieList
                                      .toList()
                                      .forEach((value) {
                                    value.name == widget.movie.name
                                        ? value.updateSeats(
                                            SeatsList.instance.seats[element])
                                        : null;
                                  });
                                });
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const HomePage()),
                                  (Route<dynamic> route) => false,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      const Spacer(
                        flex: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  InputDecoration _buildInputDecoration(
      {required String label, required String hint, String? helper}) {
    return InputDecoration(
        label: Text(label),
        border: const OutlineInputBorder(),
        hintText: hint,
        helperText: helper);
  }
}

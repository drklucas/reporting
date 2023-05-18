import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:reporting_app/models/city.model.dart';
import 'package:reporting_app/models/profile.model.dart';
import 'package:reporting_app/models/state.model.dart';
import 'package:reporting_app/repositories/location.repository.dart';
import 'package:reporting_app/services/profile/profile.service.dart';
import 'package:reporting_app/utils/comparator.dart' as cmp;
import 'package:reporting_app/utils/converter.dart' as cvt; 
import 'package:dropdown_search/dropdown_search.dart';

import '../../../../providers/location.provider.dart';

class ProfileFormScreen extends StatefulWidget {
  const ProfileFormScreen({Key? key}) : super(key: key);

  @override
  State<ProfileFormScreen> createState() => _ProfileFormScreenState();
}

class _ProfileFormScreenState extends State<ProfileFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameC = TextEditingController();

  final _last_nameC = TextEditingController();

  final _birthC = TextEditingController();

  final _birth_mask = MaskTextInputFormatter(mask: '##/##/####');

  CityModel? city; 
  StateModel? state; 

  @override
  void initState() {
    getStates();
    super.initState();
  }

  getStates() async {
    if (context.mounted) {
      await context.read<LocationRepository>().get_states(context);
    }
  }

  getCities(int uf) async {
    if (context.mounted) {
      await context
          .read<LocationRepository>()
          .get_cities(context, codigo_uf: uf);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ProfileService>().submitProfileForm(
            context: context,
            profile: ProfileModel.fromMap(
              {
                'first_name': _nameC.text, 
                'last_name': _last_nameC.text, 
                'birth_date': cvt.Converter.string_date_formatter(_birthC.text) , 
                'city':  city?.nome 

              },
            ),
            formKey: _formKey),
        backgroundColor: const Color.fromARGB(255, 42, 97, 122),
        child: const Icon(Icons.save),
      ),
      body: Container(
        color: const Color.fromARGB(255, 217, 217, 217),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: SizedBox(
                  height: 30,
                  child: Center(
                    child: Text(
                      'Dados do Perfil',
                      style: GoogleFonts.oswald(fontSize: 24),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('assets/default-avatar.jpg'),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Container(
                              width: double.infinity,
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 244, 244, 244),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(130, 128, 128, 128),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  children: [
                                    // const Icon(
                                    //   Icons.person,
                                    //   color: Color.fromARGB(255, 16, 18, 28),
                                    // ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: TextFormField(
                                          controller: _nameC,
                                          decoration: const InputDecoration(
                                            hintText: 'Nome',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: double.infinity,
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 244, 244, 244),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(130, 128, 128, 128),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  children: [
                                    // const Icon(
                                    //   Icons.person,
                                    //   color: Color.fromARGB(255, 16, 18, 28),
                                    // ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: TextFormField(
                                          controller: _last_nameC,
                                          decoration: const InputDecoration(
                                            hintText: 'Sobrenome',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                Container(
                                  width: size.width * 0.22,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(
                                        255, 244, 244, 244),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(130, 128, 128, 128),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: DropdownSearch<StateModel>(
                                      items: context
                                          .read<LocationProvider>()
                                          .states,
                                      itemAsString: (StateModel state) =>
                                          state.uf,
                                      // asyncItems: (String filter) => getData(filter),
                                      // itemAsString: (CityModel u) => u.userAsStringByName(),
                                      onChanged: (StateModel? selectedState) {
                                        state = selectedState; 
                                        if (selectedState != null) {
                                          getCities(selectedState.codigo_uf);
                                        }
                                      },
                                      dropdownDecoratorProps:
                                          const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(labelText: "UF"),
                                      ),
                                      popupProps:
                                          const PopupProps.modalBottomSheet(
                                              showSearchBox: true,
                                              searchFieldProps: TextFieldProps(
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          'Pesquisar...'))),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Container(
                                    // width: double.infinity,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 244, 244, 244),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(
                                              130, 128, 128, 128),
                                          spreadRadius: 1,
                                          blurRadius: 3,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: DropdownSearch<CityModel>(
                                        items: context
                                            .read<LocationProvider>()
                                            .cities,
                                        itemAsString: (CityModel city) =>
                                            city.nome,
                                        onChanged: (CityModel? selectedCity) => city = selectedCity,
                                        dropdownDecoratorProps:
                                            const DropDownDecoratorProps(
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                                  labelText: "Cidade"),
                                        ),
                                        popupProps: const PopupProps
                                                .modalBottomSheet(
                                            showSearchBox: true,
                                            searchFieldProps: TextFieldProps(
                                                decoration: InputDecoration(
                                                    hintText: 'Pesquisar...'))),
                                      ),
                                    ),
                                  ),
                                ),
                                // Expanded(
                                //   child: Container(
                                //     // width: double.infinity,
                                //     height: 55,
                                //     decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(10),
                                //       color: const Color.fromARGB(
                                //           255, 244, 244, 244),
                                //       boxShadow: const [
                                //         BoxShadow(
                                //           color: Color.fromARGB(
                                //               130, 128, 128, 128),
                                //           spreadRadius: 1,
                                //           blurRadius: 3,
                                //           offset: Offset(0, 3),
                                //         ),
                                //       ],
                                //     ),
                                //     child: Padding(
                                //       padding: const EdgeInsets.symmetric(
                                //           horizontal: 10.0),
                                //       child: Row(
                                //         children: [
                                //           // const Icon(
                                //           //   Icons.person,
                                //           //   color: Color.fromARGB(255, 16, 18, 28),
                                //           // ),
                                //           Expanded(
                                //             child: Padding(
                                //               padding:
                                //                   const EdgeInsets.symmetric(
                                //                       horizontal: 8.0),
                                //               child: TextFormField(
                                //                 // controller: _last_nameC,
                                //                 decoration:
                                //                     const InputDecoration(
                                //                   hintText: 'Cidade',
                                //                 ),
                                //               ),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                const SizedBox(width: 20),
                                Container(
                                  width: 65,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(
                                        255, 244, 244, 244),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(130, 128, 128, 128),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          size: 16,
                                        ),
                                        Text(
                                          'Maps',
                                          style: GoogleFonts.oswald(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    // width: double.infinity,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 244, 244, 244),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(
                                              130, 128, 128, 128),
                                          spreadRadius: 1,
                                          blurRadius: 3,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Row(
                                        children: [
                                          // const Icon(
                                          //   Icons.person,
                                          //   color: Color.fromARGB(255, 16, 18, 28),
                                          // ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: TextFormField(
                                                controller: _birthC,
                                                inputFormatters: [_birth_mask],
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: 'Nascimento',
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value == "") {
                                                    return 'Campo Obrigatório!';
                                                  }
                                                  if (cmp.Comparator
                                                      .is_after_today(value)) {
                                                    return 'Data inválida!';
                                                  }
                                                  if (!cmp.Comparator
                                                      .has_legal_age(value)) {
                                                    return 'Você precisa ter mais de 18 anos para ter um perfil!';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Container(
                                  width: 65,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(
                                        255, 244, 244, 244),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(130, 128, 128, 128),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.calendar_month,
                                          size: 16,
                                        ),
                                        Text(
                                          'Calendário',
                                          style: GoogleFonts.oswald(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

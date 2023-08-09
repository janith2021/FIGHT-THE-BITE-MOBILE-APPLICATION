import '../const/all_imports.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(File) getimage;
  const ImagePickerWidget({super.key, required this.getimage});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? selectedfile;
  final ImagePicker imagepicker = ImagePicker();
  _pickImage(ImageSource imageSource) async {
    final file = await imagepicker.pickImage(source: imageSource);
    selectedfile = File(file!.path);
    setState(() {});
    widget.getimage(selectedfile!);
  }

  _backgroundImage() {
    return selectedfile == null
        ?  const NetworkImage("https://img.freepik.com/premium-vector/businessman-avatar-cartoon-character-profile_18591-50581.jpg?w=740")//const AssetImage('Assets/profile.png')
        : FileImage(selectedfile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.white,
          radius: MediaQuery.of(context).size.height * 0.07,
          backgroundImage: _backgroundImage(),
        ),
        TextButton(
          child: Text(
            AllStrings.addimage,
            style: TextStyle(
                fontSize: AllDimensions.px20, color: AppColors.purple),
          ),
          onPressed: () {
            showModalBottomSheet(
                useSafeArea: true, 
                context: context,
                builder: (_) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            _pickImage(ImageSource.camera);
                          },
                          title: Center(
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // mainAxisSize: MainAxisSize.max,
                              // crossAxisAlignment: CrossAxisAlignment.baseline,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.camera),
                                Text(AllStrings.camera),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.amber,
                          thickness: AllDimensions.px2,
                          height: 20,
                        ),
                        ListTile(
                          onTap: () {
                            _pickImage(ImageSource.gallery);
                          },
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.image),
                              Text(AllStrings.gallery),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
        ),
      ],
    );
  }
}

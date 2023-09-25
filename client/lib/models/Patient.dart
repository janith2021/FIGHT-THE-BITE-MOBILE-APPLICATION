class Patient{

  final String id;
  final String address;
  final String wardId;
  final String name;
  final String? houseHoldNo;
  final String? divisionNo;
  final String phase;
  final String? phicomment;
  


  Patient({ required this.id, required this.address, required this.wardId, this.divisionNo, this.houseHoldNo, required this.name,required this.phase, this.phicomment});

}
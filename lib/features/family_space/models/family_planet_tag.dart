class FamilyTag {
  final int orbitNumber;
  final String name;

  const FamilyTag({
    required this.orbitNumber,
    required this.name,
  });

  const FamilyTag.personal()
      : orbitNumber = 0,
        name = 'You';

  static const List<FamilyTag> values = [
    // orbit 1
    FamilyTag(name: 'Mom', orbitNumber: 1),
    FamilyTag(name: 'Dad', orbitNumber: 1),
    // orbit 2
    FamilyTag(name: 'Husband', orbitNumber: 2),
    FamilyTag(name: 'Wife', orbitNumber: 2),
    FamilyTag(name: 'Son', orbitNumber: 2),
    FamilyTag(name: 'Daughter', orbitNumber: 2),
    // orbit 3
    FamilyTag(name: 'Brother', orbitNumber: 3),
    FamilyTag(name: 'Sister', orbitNumber: 3),
    FamilyTag(name: 'GrandMother', orbitNumber: 3),
    FamilyTag(name: 'GrandFather', orbitNumber: 3),
    FamilyTag(name: 'Uncle', orbitNumber: 3),
    FamilyTag(name: 'Aunt', orbitNumber: 3),
    // orbit 4
    FamilyTag(name: 'Great-grandma', orbitNumber: 4),
    FamilyTag(name: 'Great-grandpa', orbitNumber: 4),
  ];
}

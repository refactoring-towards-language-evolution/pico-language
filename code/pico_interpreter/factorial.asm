  dclNat("input"),
  dclNat("output"),
  dclNat("repnr"),
  dclNat("rep"),
  lvalue("input"),
  pushNat(14),
  assign(),
  lvalue("output"),
  pushNat(1),
  assign(),
  label("L1"),
  rvalue("input"),
  pushNat(1),
  sub2(),
  gofalse("L2"),
  lvalue("rep"),
  rvalue("output"),
  assign(),
  lvalue("repnr"),
  rvalue("input"),
  assign(),
  label("L3"),
  rvalue("repnr"),
  pushNat(1),
  sub2(),
  gofalse("L4"),
  lvalue("output"),
  rvalue("output"),
  rvalue("rep"),
  add2(),
  assign(),
  lvalue("repnr"),
  rvalue("repnr"),
  pushNat(1),
  sub2(),
  assign(),
  go("L3"),
  label("L4"),
  lvalue("input"),
  rvalue("input"),
  pushNat(1),
  sub2(),
  assign(),
  go("L1"),
  label("L2")

// evalExp/INDEX: n[1] throws
function test(expected) {
  function t() {throw new Error("");}

  function Foo() {this.foo = 123;}

  try {
    (new Foo())[t()];
  }
  catch (e) {
    return e.message;
  }
}

test("");

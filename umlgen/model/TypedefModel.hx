package umlgen.model;

/**
	an enum
 **/
class TypedefModel implements ModelType
{
  private var pkg : String;
  private var name : String;
  private var fields : List<Reference>;

  public function new(p, n)
  {
    pkg = p;
    name = n;
    fields = new List<Reference>();
  }

  /**
	add a field
   **/
  public function addField(f)
  {
    fields.add(f);
  }

  /**
	output this type as a dot string
   **/
  public function getDotStr() : String
  {
    return " " + name + " [ label = \"{" + name + "|" + getFieldsDotStr() + "}\" ]";
  }

  /**
	output the params as a dot string
   **/
  private function getFieldsDotStr() : String
  {
    var strBuf = new StringBuf();
    for( ff in fields )
      strBuf.add(ff.getDotStr() + "\\l");

    return strBuf.toString();
  }
}

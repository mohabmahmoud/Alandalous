isphone(String val){
  if(val.length==10){
  return (val.length==10&&val[0]=='1'&&['2','1','0','5'].contains(val[1]))?true:false;
  }else if (val.length==11){

    return (val.length==11&&val[0]=='0'&&val[1]=='1'&&['2','1','0','5'].contains(val[2]))?true:false;

  }
  return false;
}
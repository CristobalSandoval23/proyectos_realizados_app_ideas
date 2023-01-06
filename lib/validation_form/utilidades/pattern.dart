


late RegExp _regExp;
late String _pattern;


 validador(String seleccionar) {
    switch (seleccionar) {
      case "email":
        _pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        _regExp = RegExp(_pattern); 
        break;
      case "phone":
        _pattern = r'[0-9]';
        _regExp = RegExp(_pattern); 
        break;
    }

    return _regExp;
}
{
  root = "/data/nginx/html_thearcanebrony";
  locations = {
    "/" = {
      index = "index.html";
    };
    "/destroy" = {
      return = "301 https://gitlab.com/KinoshitaProductions/SecureDestroyer/-/raw/master/run";
    };
  };
}
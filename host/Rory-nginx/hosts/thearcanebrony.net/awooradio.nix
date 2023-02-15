{
  locations = {
    "/" = {
      extraConfig = ''
        rewrite ^/api/(.*) /$1 break;
        return 200 $request_uri;'';
      proxyPass = "http://localhost:4998";
    };
  };
}
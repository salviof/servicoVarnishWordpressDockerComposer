vcl 4.0;
import std;

backend default {
    .host = "172.19.0.2";
    .port = "8080";
}
backend default2 {
    .host = "172.19.0.3";
    .port = "8081";
}
backend default3 {
    .host = "172.19.0.4";
    .port = "8080";
}

sub vcl_recv {


    if (req.http.host ~ "teste.com") {
        set req.backend_hint = default;
    } elsif (req.http.host ~ "teste2.com") {
        set req.backend_hint = default2;
    } elsif (req.http.host ~ "teste3.com") {
        set req.backend_hint = default3;
    }

}

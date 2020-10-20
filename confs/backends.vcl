
backend server_auth_172_21_0_2 {
    .host = "172.21.0.2";
    .port = "8080";
    .probe = {
        .url = "/";
        .timeout = 1s;
        .interval = 3s;
        .window = 3;
        .threshold = 2;
    }
}

backend server_anon_172_21_0_3 {
    .host = "172.21.0.3";
    .port = "8080";
    .probe = {
        .url = "/";
        .timeout = 1s;
        .interval = 3s;
        .window = 3;
        .threshold = 2;
    }
}

backend server_download_172_21_0_4 {
    .host = "172.21.0.4";
    .port = "8080";
    .probe = {
        .url = "/";
        .timeout = 1s;
        .interval = 3s;
        .window = 3;
        .threshold = 2;
    }
}

import std;
import directors;
import saintmode;
sub vcl_init {

  new cluster_anon = directors.round_robin();

  new cluster_auth = directors.round_robin();

  new cluster_download = directors.round_robin();

  cluster_auth.add_backend(server_auth_172_21_0_2);

  cluster_anon.add_backend(server_anon_172_21_0_3);

  cluster_download.add_backend(server_download_172_21_0_4);
}
acl purge {
    "localhost";
    "172.17.0.0/16";
    "10.42.0.0/16";
}

sub vcl_recv {
  if (req.method == "PURGE") {
    if (!client.ip ~ purge) {
        return(synth(405, "Not allowed."));
    }
    return (purge);
  }

  set req.backend_hint = cluster_download.backend();
}

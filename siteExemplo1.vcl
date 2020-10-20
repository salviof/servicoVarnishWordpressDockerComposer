 backend siteexemplo {
    .host = "duckduckgo.com";
    .port = "443";
    .probe = {
        .url = "/siteExemplo1";
        .timeout = 1s;
        .interval = 3s;
        .window = 3;
        .threshold = 2;
    }
}



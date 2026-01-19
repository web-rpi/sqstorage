<?php
    $dbName = '{{DB_NAME}}';
    $host = '{{DB_HOST}}';
    $port = '{{DB_PORT}}';

    DB::$user = '{{DB_USER}}';
    DB::$password = '{{DB_PASS}}';
    # mySQL/mariadb
    DB::$dsn = 'mysql:host=' . $host . ';port=' . $port . ';charset=utf8;dbname=' . $dbName;

    # SQLite database
    #DB::$dsn = 'sqlite:{{SQLITE_PATH}}';

    // https://meekro.com/docs/logging.html
    DB::$logfile = null;

    // Make use of user login and registration feature
    $useRegistration = {{USE_REGISTRATION}}; // true OR false

    // Make use of pretty urls, might raise 404 errors on Pi4
    $usePrettyURLs = {{USE_PRETTY_URLS}}; // true OR false

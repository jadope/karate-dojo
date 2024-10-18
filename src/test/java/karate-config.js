//Código en JavaScript.
function fn() {
  var env = karate.env; // get java system property 'karate.env' in  build.gradle
  karate.log('karate.env system property was:', env);
  karate.configure ('ssl', true);

  if (!env) {
    env = 'local'; // a custom 'intelligent' default
  }
  var config = { // base config JSON
    authkey: '#{AUTHKEY}#'
  };
  if (env == 'dev') {
    config.authkey
    config.urlBase = 'https://rickandmortyapi.dev.com';
  } else if (env == 'cer') {
   config.authkey
   config.urlBase = 'https://rickandmortyapi.qa.com';
  }else if (env == 'local') {
    config.authkey
     config.urlBase = 'https://rickandmortyapi.qa.com';

  }

  config = {
    urlBase: 'https://rickandmortyapi.com',
  };

  karate.configure('ssl', true);
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}
function fn() {
  var env = karate.env; 
  if (!env) {
    env = 'dev';
  }

  var config = {
    env: env,
    baseUrl: 'https://api.demoblaze.com',
    
    // 1. Función Sleep
    sleep: function(millis) {
      var Thread = Java.type('java.lang.Thread');
      Thread.sleep(millis);
    },
    
    // 2. Función Random User
    randomUser: function() {
      var System = Java.type('java.lang.System');
      return 'user_' + System.currentTimeMillis(); 
    }
  }

  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);

  return config;
}
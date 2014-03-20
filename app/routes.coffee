console.log(__dirname);
authorization = require("./routes/middlewares/authorization")
articles = require("./controllers/articles")
charts = require("./controllers/charts")
users = require("./controllers/users")
index = require("./controllers/index")
module.exports = (app,passport) ->
  ###
  hasAuthorization = (req, res, next) ->
    return res.send(401, "User is not authorized") if req.article.user.id isnt req.user.id
    next()

  # Articles API
  app.get "api/articles", articles.all
  app.post "api/articles", authorization.requiresLogin, articles.create
  app.get "api/articles/:articleId", articles.show
  app.put "api/articles/:articleId", authorization.requiresLogin, hasAuthorization, articles.update
  app.del "api/articles/:articleId", authorization.requiresLogin, hasAuthorization, articles.destroy

  # Finish with setting up the articleId param
  app.param "articleId", articles.article

  # User API# Setting up the users api
  app.post "/users", users.create
  
  # Setting up the userId param
  app.param "userId", users.user
  
  # Setting the local strategy route
  app.post "/users/session", passport.authenticate("local",
    failureRedirect: "/signin"
    failureFlash: true
  ), users.session
  
  # Setting the facebook oauth routes
  app.get "/auth/facebook", passport.authenticate("facebook",
    scope: [
      "email"
      "user_about_me"
    ]
    failureRedirect: "/signin"
  ), users.signin

  app.get "/auth/facebook/callback", passport.authenticate("facebook",
    failureRedirect: "/signin"
  ), users.authCallback
  
  # Setting the github oauth routes
  app.get "/auth/github", passport.authenticate("github",
    failureRedirect: "/signin"
  ), users.signin
  app.get "/auth/github/callback", passport.authenticate("github",
    failureRedirect: "/signin"
  ), users.authCallback
  
  # Setting the twitter oauth routes
  app.get "/auth/twitter", passport.authenticate("twitter",
    failureRedirect: "/signin"
  ), users.signin
  app.get "/auth/twitter/callback", passport.authenticate("twitter",
    failureRedirect: "/signin"
  ), users.authCallback
  
  # Setting the google oauth routes
  app.get "/auth/google", passport.authenticate("google",
    failureRedirect: "/signin"
    scope: [
      "https://www.googleapis.com/auth/userinfo.profile"
      "https://www.googleapis.com/auth/userinfo.email"
    ]
  ), users.signin
  app.get "/auth/google/callback", passport.authenticate("google",
    failureRedirect: "/signin"
  ), users.authCallback
  
  # Setting the linkedin oauth routes
  app.get "/auth/linkedin", passport.authenticate("linkedin",
    failureRedirect: "/signin"
    scope: ["r_emailaddress"]
  ), users.signin
  app.get "/auth/linkedin/callback", passport.authenticate("linkedin",
    failureRedirect: "/siginin"
  ), users.authCallback
  ###
  app.get "*", (req, res) ->
    res.sendfile './public/views/index.html'

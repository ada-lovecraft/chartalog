
# Articles routes use articles controller
articles = require("../controllers/articles")
authorization = require("./middlewares/authorization")

# Article authorization helpers


module.exports = (app) ->
  app.get "api/articles", articles.all
  app.post "api/articles", authorization.requiresLogin, articles.create
  app.get "api/articles/:articleId", articles.show
  app.put "api/articles/:articleId", authorization.requiresLogin, hasAuthorization, articles.update
  app.del "api/articles/:articleId", authorization.requiresLogin, hasAuthorization, articles.destroy
  
  # Finish with setting up the articleId param
  app.param "articleId", articles.article
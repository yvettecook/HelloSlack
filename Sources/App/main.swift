import Vapor

let drop = Droplet()

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.get("hello") { req in
  return "Hello, world!"
}

drop.post("gateway") { req in
  return "Hello, slack!"
}

drop.resource("posts", PostController())

drop.run()

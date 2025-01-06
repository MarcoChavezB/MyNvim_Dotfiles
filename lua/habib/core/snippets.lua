
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local ts = "typescript"
local ht = "html"
local cs = "css"
local ph = "php"

ls.add_snippets("all", {
    s("test", {
        t("Hello, this is a test snippet"),
    }),
})
ls.add_snippets("all", {
  s("co", {
    t("console.log("),
    i(1),
    t(");"),
  }),
})


ls.add_snippets("all", {
    s("comment", {
        t({"/*", " * "}),
        i(1, "Your comment"),
        t({"", " */"})
    }),
})


-- name: number = 0
ls.add_snippets("all", {
  s("num", {
    t(": number = 0"),
  }),
})

ls.add_snippets("all", {
  s("str", {
    t(": string = ''"),
  }),
})

ls.add_snippets("all", {
  s("bol", {
    t(": boolean = false"),
  }),
})

ls.add_snippets("all", {
  s("resp", {
    t("return response()->json();"),
  }),
})


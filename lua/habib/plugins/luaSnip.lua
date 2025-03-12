return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",  -- Si estás usando jsregexp, esta es la manera de instalarlo.
    requires = {
        "rafamadriz/friendly-snippets",  -- Asegúrate de que este plugin esté incluido
    },
    config = function()
        local ls = require("luasnip")
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node

        -- Configuración global para LuaSnip
        ls.config.set_config({
            history = true,
            updateevents = "TextChanged,TextChangedI",  -- Esto asegura que se actualicen los snippets al escribir
        })

        ls.add_snippets("all", { 
          -- Snippet para un widget MY_CLASS en Flutter
          s("sodart", {
            t("import 'package:flutter/material.dart';"),
            t({"", ""}),
            t("class "),
            i(1),
            t(" extends StatelessWidget {"),
            t({"", "  const MY_CLASS({super.key});"}),
            t({"", ""}),
            t("  @override"),
            t({"", "  Widget build(BuildContext context) {"}),
            t({"", "    return Scaffold("}),
            t({"", "      appBar: AppBar("}),
            t({"", "        title: const Text('Flutter Demo Home Page'),"}),
            t({"", "      ),"}),
            t({"", "      body: const Center("}),
            t({"", "      ),"}),
            t("    );"),
            t("  }"),
            t("}")
          }),



        s("resp", {
            t('return response()->json('),
            i(1),
            t(');')
          })
        })


        s("comment", {
            t({"/*", " * "}),
            i(1, "Your comment"),
            t({"", " */"})
        })

    end,
}

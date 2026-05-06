---@diagnostic disable: undefined-global

local function header_guard()
  local name = vim.fn.expand("%:t")
  return name:gsub("%.", "_"):gsub("[^%w_]", "_"):upper()
end

return {
  s(
    { trig = "cp", name = "Competitive Programming Template", dscr = "Standard C++ CP boilerplate" },
    {
      t({
        "#include <bits/stdc++.h>",
        "#define ll long long",
        "using namespace std;",
        "",
        "int main()",
        "{",
        "  ios_base::sync_with_stdio(false);",
        "  cin.tie(NULL);",
        "  ",
      }),
      i(1),
      t({
        "",
        "  return 0;",
        "}",
      }),
    }
  ),

  s("guard", {
    t("#ifndef "),
    f(header_guard),
    t({ "", "#define " }),
    f(header_guard),
    t({ "", "", "" }),
    t({ "", "#endif" }),
  }),

  s("for", {
    t("for ("),
    i(1, "int"),
    t(" "),
    i(2, "i"),
    t(" = "),
    i(3, "0"),
    t("; "),
    rep(2),
    t(" < "),
    i(4, "n"),
    t("; "),
    rep(2),
    t(" "),
    i(5, "++"),
    t(") {"),
    t({ "", "  " }),
    i(0),
    t({ "", "}" }),
  }),
}

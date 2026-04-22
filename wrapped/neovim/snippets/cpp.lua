---@diagnostic disable: undefined-global
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
}

---@diagnostic disable: undefined-global

-- https://github.com/dogeystamp/dots/blob/8299e0b2c0db4d287640e588d075985385fba81e/src/dot_config/nvim/snippets/typst.lua

return {
  s({ trig = "lim", name = "limit", wordTrig = true }, fmt("lim_({}) ", { i(1) })),
  s(
    { trig = "intd", name = "integral (definite)", wordTrig = true },
    fmt("integral_({})^({}) ", { i(1), i(2) })
  ),
  s({ trig = "sum", name = "summation", wordTrig = true }, fmt("sum_({})^({}) ", { i(1), i(2) })),
  s({ trig = "inf", name = "infinity", wordTrig = true }, t("infinity")),
  s({ trig = "abs", name = "absolute value", wordTrig = true }, fmt("abs({})", { i(1) })),
  s(
    { trig = "link", desc = "labelled link" },
    fmt('#link("{}{}")[{}]', {
      i(1),
      f(function(args, _)
        if not args[1][1] or args[1][1] == "" then
          return vim.fn.getreg("+")
        else
          return ""
        end
      end, { 1 }),
      i(2),
    })
  ),
}

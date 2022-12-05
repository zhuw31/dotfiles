return {
  s(
    'clg',
    fmt(
      [[
        console.log({{
          {}
        }})
      ]],
      {
        i(1, 'var'),
      }
    )
  ),
  s(
    'iff',
    fmt(
      [[
    if ({}) {{
      {}
    }}
    ]],
      {
        i(1, 'condition'),
        i(2, '// TODO:'),
      }
    )
  ),
  s(
    'us',
    fmt([[const [{}, {}] = useState{}({})]], {
      i(1),
      f(function(args)
        local getter = args[1][1]
        return 'set' .. getter:sub(1, 1):upper() .. getter:sub(2)
      end, { 1 }),
      i(2),
      i(3),
    })
  ),
  s(
    'ue',
    fmt(
      [[
    useEffect(() => {{
      {}
    }}, [{}])
    ]],
      {
        c(2, {
          t '// TODO:',
          fmt(
            [[
          async function {}() {{
            {}
          }}

          {}()
          ]],
            {
              i(1),
              i(2, '// TODO:'),
              rep(1),
            }
          ),
        }),
        i(1, 'dep'),
      }
    )
  ),
  s(
    'de',
    fmt(
      [[
    describe{}("{}", () => {{
      {}
    }})
    ]],
      {
        c(1, {
          t '',
          t '.concurrent',
        }),
        i(2),
        i(3, '// TODO:'),
      }
    )
  ),
  s(
    'te',
    fmt(
      [[
      test("{}", {}() => {{
        {}
      }})
      ]],
      {
        i(1),
        c(2, {
          t '',
          t 'async ',
        }),
        i(3, '// TODO:'),
      }
    )
  ),
}

local opts = {
  completion = {
    list = {
      selection = {
        preselect = false,
      },
    },
  },
  fuzzy = {
    implementation = "prefer_rust",
  },
}

return opts

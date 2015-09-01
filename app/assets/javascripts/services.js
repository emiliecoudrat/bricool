jQuery ->
  $(".button_submit").on "click", (e) ->
    e.preventDefault()
    $("#detecteur-form").submit()
    $("#bricolage-form").submit()
    $("#montage-simple-form").submit()
    $("#montage-moyen-form").submit()
    $("#montage-complexe-form").submit()
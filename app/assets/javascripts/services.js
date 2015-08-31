jQuery ->
  $(".button_submit").live "click", (e) ->
    e.preventDefault()
    $("#decteur-form").trigger "submit"
    $("#bricolage-form").trigger "submit"
    $("#montage-simple-form").trigger "submit"
    $("#montage-moyen-form").trigger "submit"
    $("#montage-complexe-form").trigger "submit"
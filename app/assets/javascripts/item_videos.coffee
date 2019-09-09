# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#new_item_video').fileupload
    dataType: "script"
    add: (e, data) ->
      types = /(\.|\/)(mp4|webm|avi)$/i
      file = data.files[0]
      if types.test(file.type) || types.test(file.name)
        data.context = $(tmpl("template-upload", file))
        $('#new_item_video').append(data.context)
        data.submit()
      else
        alert("#{file.name} is not a mp4, webm, or avi video file")
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')
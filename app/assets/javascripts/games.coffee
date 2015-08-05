# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

current_index = 1

addRule = ->
  current_index += 1
  html = """
    <div class="adding_rule">
      <select name="game[rules_attributes][#{current_index}][drink]" id="game_rules_attributes_#{current_index}_drink">
          <option>Full Beer</option>
          <option>Half Beer</option>
          <option>Sip O'beer</option>
          <option>SHOTZ</option>
      </select>      
      <input placeholder="Rules" type="text" name="game[rules_attributes][#{current_index}][rules]" id="game_rules_attributes_#{current_index}_rules">
      
      <input type="hidden" value="false" name="game[rules_attributes][#{current_index}][_destroy]" id="game_rules_attributes_#{current_index}__destroy">
      <a class="remove_fields" href="#">remove</a>
      </br>
    </div>
  """
  $("#new_rule input[type='submit']").before(html)
  



$(document).on 'ready page:load', ->

  $('#add-rule').on('click', addRule)

  $('form').on 'click', '.remove_fields', (event) ->
    $(this).parent().remove()
    event.preventDefault()



# $(document).ready(ready)
# $(document).on('page:load', ready)

# $(document).on 'click', '#add-rule', ready
  
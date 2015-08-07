# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



addRule = ->
  
  html = """
    <div class="adding_rule">
        <label for="game_rules_attributes_#{current_index}_Drink">Drink</label>
        <select name="game[rules_attributes][#{current_index}][drink]" id="game_rules_attributes_#{current_index}_drink">
            <option>Full Beer</option>
            <option>Half Beer</option>
            <option>Sip O'beer</option>
            <option>SHOTZ</option>
        </select>          
        <br>
        <label for="game_rules_attributes_#{current_index}_Rules">Rules</label>
        <input type="text" name="game[rules_attributes][#{current_index}][rules]" id="game_rules_attributes_#{current_index}_rules">
        <input type="hidden" value="false" name="game[rules_attributes][#{current_index}][_destroy]" id="game_rules_attributes_#{current_index}__destroy">
        <a class="remove_fields" href="#">Remove</a>
    </div>
  """
  current_index += 1
  $("#add_rule").before(html)
  

$(document).on 'ready page:load', ->
  window.current_index = $('.adding_rule').length
  console.log current_index

  $('#add_rule').on('click', addRule)

  $('form').on 'click', '.remove_fields', (event) ->
    $(this).parent().remove()
    event.preventDefault()

  


# $(document).ready(ready)
# $(document).on('page:load', ready)

# $(document).on 'click', '#add-rule', ready



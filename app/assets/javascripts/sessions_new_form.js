$(document).on('turbolinks:load', function() {
    
    //Make the dropdown properly selectable
    var data = {};
    $("#games option").each(function(i,el) {  
       data[$(el).data("value")] = $(el).val();
    });

    $("#selectedGame").on('input', function () {
        setHiddenGameIdValue(this.value);
    });

    function setHiddenGameIdValue(inputGameName) {
        var selectedGame = $('#games').find('option').filter(function(){
            return this.value == inputGameName;
        });

        if (selectedGame.length > 0) {
            var gameId = $(selectedGame[0]).data('value');
            $('#session_game_id').val(gameId);
            showFormBasedOnGame();
        }
    }

    function showFormBasedOnGame() {
        $('session-forms').hide();
        $('session-forms input').prop('disabled', true);
        
        // TODO add conditional here
        $('#form_competitive').show();
        $('#form_competitive input').prop('disabled', false);
    }
});
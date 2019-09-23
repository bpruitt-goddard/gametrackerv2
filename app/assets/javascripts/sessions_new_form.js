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
            var isCoop = $(selectedGame[0]).data('iscoop')
            $('#session_game_id').val(gameId);
            showFormBasedOnGame(isCoop);
        }
    }

    function showFormBasedOnGame(isCoop) {
        $('.session-forms').hide();
        $('.session-forms input').prop('disabled', true);
        
        if(isCoop) {
            $('#form_coop').show();
            $('#form_coop input').prop('disabled', false);
        }
        else {
            $('#form_competitive').show();
            $('#form_competitive input').prop('disabled', false);
        }
    }
});
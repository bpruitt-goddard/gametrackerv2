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
            console.log(gameId);
            $('#session_game_id').val(gameId);    
        }
    }
});
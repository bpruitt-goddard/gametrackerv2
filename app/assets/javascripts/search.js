$(document).on('turbolinks:load', function() {
    $("#selectedGame").on('input', function () {
        setHiddenGameIdValue(this.value);
    });

    $("#selectedPlayer").on('input', function () {
        setHiddenPlayerIdValue(this.value);
    });

    function setHiddenGameIdValue(inputGameName) {
        var selectedGame = $('#games').find('option').filter(function(){
            return this.value == inputGameName;
        });

        if (selectedGame.length > 0) {
            var gameId = $(selectedGame[0]).data('value');
            $('#game_id').val(gameId);    
        }
    }

    function setHiddenPlayerIdValue(inputPlayerName) {
        var selectedPlayer = $('#players').find('option').filter(function(){
            return this.value == inputPlayerName;
        });

        if (selectedPlayer.length > 0) {
            var playerId = $(selectedPlayer[0]).data('value');
            $('#player_id').val(playerId);    
        }
    }
});
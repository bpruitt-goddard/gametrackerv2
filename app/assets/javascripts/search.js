$(document).on('turbolinks:load', function() {
    // Set initial dropdown values on load from a search
    var initialPlayerId = $('#player_id').val();
    if (initialPlayerId !== '') {
        setDisplayPlayerNameFromId(initialPlayerId);
    }
    
    var initialGameId = $('#game_id').val();
    if (initialGameId !== '') {
        setDisplayGameNameFromId(initialGameId);
    }
    
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

    function setDisplayPlayerNameFromId(playerId) {
        var selectedPlayer = $('#players').find('option').filter(function(){
            return this.getAttribute('data-value') == playerId;
        });

        if (selectedPlayer.length > 0) {
            var playerName = selectedPlayer[0].value;
            $('#selectedPlayer').val(playerName);
        }
    }

    function setDisplayGameNameFromId(gameId) {
        var selectedGame = $('#games').find('option').filter(function(){
            return this.getAttribute('data-value') == gameId;
        });

        if (selectedGame.length > 0) {
            var gameName = selectedGame[0].value;
            $('#selectedGame').val(gameName);
        }
    }
});
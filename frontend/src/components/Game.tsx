import { FC } from 'react';
import { RouteComponentProps } from 'react-router-dom';

interface GameProps {
    id: string;
}

const Game : FC<RouteComponentProps<GameProps>> = props => {
    const { id } = props.match.params;

    return (
        <div>
            <h2>Game Id: {id}</h2>
            This is a single game!
        </div>
    );
}

export default Game;
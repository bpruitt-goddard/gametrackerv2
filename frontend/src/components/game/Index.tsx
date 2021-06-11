import { FC } from 'react';
import { RouteComponentProps } from 'react-router-dom';

interface IGameProps {
    id: string;
}

const Index : FC<RouteComponentProps<IGameProps>> = props => {
    const { id } = props.match.params;

    return (
        <div>
            <h2>Game Id: {id}</h2>
            This is a single game!
        </div>
    );
}

export default Index;
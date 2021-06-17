import { FC, useState } from 'react';
import { RouteComponentProps } from "react-router-dom";
import { IGame } from '../../services/type';
import { IGameProps } from './IGameProps';

const AddEdit : FC<RouteComponentProps<IGameProps>> = props => {
	const { id } = props.match.params;
	const [game, setGame] = useState<IGame>({name: 'Gloom', id: 4, bgg_id: 123, game_type: 'competitive'});

	return (
	    <div>
		    Editing game {id}<br />
		    Game Name: {game.name}
	    </div>
	);
}

export default AddEdit;
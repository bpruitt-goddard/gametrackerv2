import { FC, useEffect, useState } from 'react';
import { Link, RouteComponentProps } from "react-router-dom";
import { getGame } from '../../services/games';
import { IGame } from '../../services/type';
import { IGameProps } from './IGameProps';

const AddEdit : FC<RouteComponentProps<IGameProps>> = props => {
	const { id } = props.match.params;
	const isAddMode = !id;
	const [game, setGame] = useState<IGame>({name: 'Gloom', id: 4, bgg_id: 123, game_type: 'competitive'});

	useEffect(() => {
		if (isAddMode)
			return;

		getGame<IGame>(+id)
          .then(game => {
            setGame(game);
        })
	}, [])


	function onSubmit() {
	}

	return (
		<form onSubmit={onSubmit}>
			<h1>{isAddMode ? "New Game" : game.name}</h1>
			<div className="form-group">
				<button
					type="submit"
					className="btn btn-primary">
					Save
				</button>
				<Link
					to={isAddMode ? '.' : '..'}
					className="btn btn-link"
					>
					Cancel
				</Link>

			</div>

		</form>
	);
}

export default AddEdit;
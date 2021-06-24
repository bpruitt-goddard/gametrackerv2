import React, { FC, useEffect, useState } from 'react';
import { Link, RouteComponentProps } from "react-router-dom";
import { Button, Input, Label } from 'reactstrap';
import { createGame, getGame, updateGame } from '../../services/games';
import { IGame, GameType } from '../../services/type';
import { IGameProps } from './IGameProps';

const AddEdit : FC<RouteComponentProps<IGameProps>> = props => {
	const { id } = props.match.params;
	const isAddMode = !id;
	const [game, setGame] = useState<IGame>({} as IGame);

	useEffect(() => {
		if (isAddMode)
			return;

		getGame(+id)
          .then(game => {
            setGame(game);
        })
	}, [id, isAddMode]);

	function handleChange(event: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) {
		setGame({
			...game,
			[event.target.name]: event.target.value
		});
	}

	function handleSubmit(event: React.FormEvent<HTMLFormElement>) {
		event.preventDefault();

		return isAddMode
		 ? handleAdd()
		 : handleUpdate()
	}

	function handleAdd() {
		return createGame(game)
			.then(() => props.history.push('.'));
	}

	function handleUpdate() {
		return updateGame(game)
			.then(() => props.history.push('..'));
	}

	return (
		<form onSubmit={handleSubmit}>
			<h1>{isAddMode ? "New Game" : "Editing Game"}</h1>

			<div className="form-group col-12 col-md-3">
				<Label for="name">Name</Label>
				<Input
					type="text"
					name="name"
					value={game.name}
					onChange={handleChange} />
			</div>

			<div className="form-group col-10 col-md-3">
				<Label for="number">Bgg Id</Label>
				<Input
					type="number"
					name="bgg_id"
					value={game.bgg_id}
					onChange={handleChange} />
			</div>

			<div className="form-group col-6 col-md-2">
				<Label for="game_type">Game Type</Label>
				<Input
					type="select"
					value={game.game_type}
					name="game_type"
					onChange={handleChange}
					style={{textTransform: 'capitalize'}}>
						<option selected disabled hidden>
							Select Type
						</option>
					{Object.keys(GameType).map(key => (
						<option key={key} value={key} style={{textTransform: 'capitalize'}}>
							{key}
						</option>
					))}
				</Input>
			</div>

			<div className="form-group">
				<Button>
					Save
				</Button>
				<Link
					to={isAddMode ? '.' : '..'}
					className="btn btn-link">
					Cancel
				</Link>

			</div>

		</form>
	);
}

export default AddEdit;
import { useState } from 'react';
import { Link, Route, Switch } from 'react-router-dom';
import { Table } from 'reactstrap';
import Game from './Game';

interface game {
    id: number;
    name: string;
    bgg_id: number;
    game_type: string;
}

function Games() {

    const [list, setList] = useState<game[]>([]);

    return (
        <div>
            <h2>Game</h2>
            Game page!
            <Switch>
                <Route path="/games/:id" component={Game} />
                <Route render={() => GetGames()} />
            </Switch>
        </div>
    );

    function GetGames() {
        return (
            <div>
                <Table>
                    <thead>
                        <th>Name</th>
                        <th>Bgg Id</th>
                        <th>Game Type</th>
                        <th></th>
                    </thead>
                    <tbody>
                        {
                            list.map(g => {
                                return (
                                    <tr key={g.id}>
                                        <th>
                                            <Link to={`games/${g}`}>{g.name}</Link>
                                        </th>
                                        <th>{g.id}</th>
                                        <th>{g.game_type}</th>
                                    </tr>
                                );
                            })
                        }
                    </tbody>
                </Table>
            </div>
        )
    }
}

// function Games() {
// }


export default Games;